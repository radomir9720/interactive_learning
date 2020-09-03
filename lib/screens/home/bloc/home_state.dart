part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingPostsState extends HomeState {}

class HomeLoadedPostsState extends HomeState {}

class HomeLoadPostsErrorState extends HomeState {}
