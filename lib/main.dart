import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_learning/global/app_themes.dart';
import 'package:interactive_learning/screens/home/home.dart';
import 'package:interactive_learning/screens/post/post.dart';

import 'global/bloc/app_bloc.dart';

void main() {
  runApp(InteractiveLearning());
}

class InteractiveLearning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is AppInitial) {
            BlocProvider.of<AppBloc>(context).add(AppLoadInitialEvent());
            return Container(
              child: MaterialApp(
                home: const Scaffold(
                  backgroundColor: const Color(0xff424141),
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            title: 'InteractiveLearning',
            theme: appThemeData[AppTheme.dark],
            routes: {
              HomeScreen.id: (context) => HomeScreen(),
              PostScreen.id: (context) =>
                  PostScreen(post: ModalRoute.of(context).settings.arguments),
            },
          );
        },
      ),
    );
  }
}
