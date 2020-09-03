import 'package:flutter/material.dart';
import 'package:interactive_learning/global/constants.dart';
import 'package:interactive_learning/global/models/post.dart';
import 'package:interactive_learning/screens/post/post.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel post;
  const PostCardWidget({
    this.post,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kStandardMargin,
      decoration: BoxDecoration(
        borderRadius: kCardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: MaterialButton(
        onPressed: post == null
            ? null
            : () =>
                Navigator.of(context).pushNamed(PostScreen.id, arguments: post),
        minWidth: 0,
        padding: kStandardPadding,
        shape: RoundedRectangleBorder(borderRadius: kCardBorderRadius),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              color: Theme.of(context).backgroundColor,
              child: post?.photoUrl != null
                  ? Image.network(
                      post.photoUrl,
                      fit: BoxFit.contain,
                    )
                  : null,
            ),
            const SizedBox(
              width: kStandardPaddingDouble,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        post?.title ?? '',
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kStandardPaddingDouble,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      post?.body ?? '',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
