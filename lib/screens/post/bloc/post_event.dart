part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostLoadCommentsEvent extends PostEvent {
  final int postId;

  PostLoadCommentsEvent(this.postId);
}
