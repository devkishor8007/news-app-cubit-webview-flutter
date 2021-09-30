import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:read_me_flutter_app/cubit/news_cubit/newsy.state.dart';
import 'package:read_me_flutter_app/data/remote/helper.dio.dart';
import 'package:read_me_flutter_app/modules/business/business_screen.dart';
import 'package:read_me_flutter_app/modules/health/health_screen.dart';
import 'package:read_me_flutter_app/modules/sports/sports_screen.dart';

class CubitNews extends Cubit<NewsState> {
  CubitNews() : super(InitialState());

  static CubitNews get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety),
      label: 'Health',
    ),
  ];

  List<Widget> screens = [
    const BusinessSceen(),
    const SportsScreen(),
    const HealthSceen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getBusiness();
    if (index == 2) getSports();
    emit(NavBarChangeState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(BuinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': dotenv.env['API_KEY']
      },
    ).then((value) {
      business = value.data['articles'];
      emit(BuinessSuccessState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(BuinessErrorState(e.toString()));
    });
  }

  List<dynamic> sport = [];
  void getSports() {
    emit(SportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': dotenv.env['API_KEY']
      },
    ).then((value) {
      sport = value.data['articles'];
      emit(SportsSuccessState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(SportsErrorState(e.toString()));
    });
  }

  List<dynamic> health = [];
  void getHealth() {
    emit(HealthLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'health',
        'apiKey': dotenv.env['API_KEY']
      },
    ).then((value) {
      health = value.data['articles'];
      emit(HealthSuccessState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(HealthErrorState(e.toString()));
    });
  }
}
