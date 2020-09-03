import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_learning/global/constants.dart';
import 'package:interactive_learning/global/models/post.dart';
import 'package:interactive_learning/screens/post/bloc/post_bloc.dart';
import 'package:interactive_learning/screens/post/widgets/comment_card.dart';
import 'package:shimmer/shimmer.dart';

class PostScreen extends StatefulWidget {
  final PostModel post;
  const PostScreen({
    @required this.post,
    Key key,
  }) : super(key: key);

  static const String id = '/post';

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostBloc _postBloc = PostBloc();

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(widget.post.photoUrl),
              Positioned(
                top: kStandardPaddingDouble,
                left: kStandardPaddingDouble,
                child: MaterialButton(
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: const Icon(Icons.arrow_back),
                    ),
                    onPressed: () => Navigator.of(context).pop()),
              ),
              Positioned(
                bottom: kStandardPaddingDouble,
                left: kStandardPaddingDouble,
                right: kStandardPaddingDouble,
                child: Container(
                  padding: kStandardPadding,
                  decoration: BoxDecoration(
                    borderRadius: kCardBorderRadius,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Text(
                    widget.post.title,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: kStandardMargin,
            child: Text(
              widget.post.body.replaceAll('\n', ''),
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.justify,
            ),
          ),
          BlocBuilder<PostBloc, PostState>(
            cubit: _postBloc,
            buildWhen: (previous, current) =>
                current is PostLoadCommentsErrorState ||
                current is PostLoadedCommentsState ||
                current is PostLoadingCommentsState,
            builder: (context, state) {
              if (state is PostInitial) {
                _postBloc.add(PostLoadCommentsEvent(widget.post.id));
              }
              if (state is PostLoadedCommentsState) {
                return Column(
                  children: state.comments
                      .map((e) => CommentCardWidget(comment: e))
                      .cast<Widget>()
                      .toList(),
                );
              } else if (state is PostLoadCommentsErrorState) {
                return Padding(
                  padding: kStandardPadding,
                  child: Text('Что-то пошло не так...'),
                );
              }
              return Shimmer.fromColors(
                child: Column(
                  children: List.generate(
                          5, (index) => CommentCardWidget(comment: null))
                      .cast<Widget>()
                      .toList(),
                ),
                baseColor: Theme.of(context).disabledColor,
                highlightColor: Theme.of(context).dividerColor,
                enabled: true,
              );
            },
          )
        ],
      ),
    );
  }
}
