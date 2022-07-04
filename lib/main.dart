import 'package:fake_weather/features/weather/presentation/pages/weather_search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:fake_weather/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepositoryImpl()),
        child: const WeatherSearchPage(),
      ),
    );
  }
}
