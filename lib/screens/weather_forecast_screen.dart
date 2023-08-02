import 'package:flutter/material.dart';
import 'package:weathear_app/api/weather_api.dart';
import 'package:weathear_app/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathear_app/screens/city_screen.dart';
import 'package:weathear_app/utilities/location.dart';
import 'package:weathear_app/widgets/buttom_list_view.dart';
import 'package:weathear_app/widgets/city_view.dart';

import '../widgets/detail_view.dart';
import '../widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  late final locationWeather;
  WeatherForecastScreen({this.locationWeather});
  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName = 'London';
  // late String _cityName;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName);
    }

    // forecastObject.then((weather) {
    //   print(weather.list?[0].weather[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Weather APP',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location, color: Colors.white),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi()
                  .fetchWeatherForecast(cityName: _cityName, isCity: true);
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject =
                      WeatherApi().fetchWeatherForecast(cityName: _cityName);
                });
              }
            },
            icon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      CityView(snapshot: snapshot),
                      SizedBox(
                        height: 50,
                      ),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.black,
                      size: 100,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
