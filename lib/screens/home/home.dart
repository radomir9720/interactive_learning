import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_learning/screens/home/bloc/home_bloc.dart';
import 'package:interactive_learning/screens/home/widgets/post_card.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const String id = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список постов'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        cubit: _homeBloc,
        buildWhen: (previous, current) =>
            // В принципе, можно было и не распыляться, и не ставить условия,
            // так как другие стэйты прилететь не могут, поскольку других просто нет.
            // По привычке сделал.
            current is HomeLoadPostsErrorState ||
            current is HomeLoadedPostsState ||
            current is HomeLoadingPostsState,
        builder: (context, state) {
          return state is HomeLoadingPostsState || state is HomeInitial
              ? Shimmer.fromColors(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) => const PostCardWidget(),
                  ),
                  baseColor: Theme.of(context).disabledColor,
                  highlightColor: Theme.of(context).dividerColor,
                  enabled: true,
                )
              : state is HomeLoadedPostsState
                  ? ListView.builder(
                      itemCount: _homeBloc.posts?.length,
                      itemBuilder: (context, index) => PostCardWidget(
                        post: _homeBloc.posts[index],
                      ),
                    )
                  : Center(child: const Text('Что-то пошло не так'));
        },
      ),
    );
  }
}
