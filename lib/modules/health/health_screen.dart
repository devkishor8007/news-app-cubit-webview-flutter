import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_me_flutter_app/components/get_components.dart';
import 'package:read_me_flutter_app/cubit/news_cubit/newsy.cubit.dart';
import 'package:read_me_flutter_app/cubit/news_cubit/newsy.state.dart';

class HealthSceen extends StatelessWidget {
  const HealthSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CubitNews, NewsState>(
      builder: (context, state) {
        var health = CubitNews.get(context).health;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: showDataListViewBuilder(health, size),
        );
      },
    );
  }
}
