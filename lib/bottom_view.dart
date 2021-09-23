import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_me_flutter_app/cubit/news_cubit/newsy.cubit.dart';
import 'package:read_me_flutter_app/cubit/news_cubit/newsy.state.dart';

class MainBottomPage extends StatelessWidget {
  final String name;
  const MainBottomPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitNews()
        ..getBusiness()
        ..getSports()
        ..getHealth(),
      child: BlocBuilder<CubitNews, NewsState>(
        builder: (context, state) {
          var cubit = CubitNews.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(name),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
