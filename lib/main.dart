import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:read_me_flutter_app/bottom_view.dart';
import 'package:read_me_flutter_app/cubit/news_cubit/newsy.cubit.dart';
import 'package:read_me_flutter_app/cubit/news_cubit/newsy.state.dart';
import 'package:read_me_flutter_app/data/remote/helper.dio.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitNews()
        ..getSports()
        ..getBusiness()
        ..getHealth(),
      child: BlocBuilder<CubitNews, NewsState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'ReadMe Flutter',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: const MainBottomPage(
              name: "ReadMe Flutter",
            ),
          );
        },
      ),
    );
  }
}
