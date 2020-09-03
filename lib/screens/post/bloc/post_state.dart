part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoadedCommentsState extends PostState {
  final List<CommentModel> comments;

  PostLoadedCommentsState(this.comments);
}

class PostLoadingCommentsState extends PostState {}

class PostLoadCommentsErrorState extends PostState {}
