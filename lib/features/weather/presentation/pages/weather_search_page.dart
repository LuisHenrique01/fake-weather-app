import 'package:fake_weather/features/weather/data/models/weather_model.dart';
import 'package:fake_weather/features/weather/presentation/widgets/city_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_weather/features/weather/presentation/cubit/weather_cubit.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisar Temperatura"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext _) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        state.message,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  });
            }
          },
          builder: ((context, state) {
            if (state is WeatherInitial) {
              return buildInitialInput();
            }
            if (state is WeatherLoading) {
              return buildLoading();
            }
            if (state is WeatherLoaded) {
              return buildColumnWithData(state.weather);
            }
            return buildInitialInput();
          }),
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return const Center(
      child: CityInputFieldWidget(),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(WeatherModel weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "${weather.temperature.toStringAsFixed(1)} °C",
          style: const TextStyle(fontSize: 80),
        ),
        const CityInputFieldWidget(),
      ],
    );
  }
}
