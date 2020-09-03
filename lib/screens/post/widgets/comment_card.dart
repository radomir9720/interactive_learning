import 'package:flutter/material.dart';
import 'package:interactive_learning/global/constants.dart';
import 'package:interactive_learning/global/models/comment.dart';

class CommentCardWidget extends StatelessWidget {
  final CommentModel comment;
  const CommentCardWidget({
    @required this.comment,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kStandardPadding,
      margin: kStandardMargin,
      decoration: BoxDecoration(
        borderRadius: kCardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              comment?.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              comment?.email ?? '',
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(comment?.body ?? '\n\n\n'),
        ],
      ),
    );
  }
}
