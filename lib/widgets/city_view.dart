import 'package:flutter/material.dart';
import 'package:weathear_app/models/weather_forecast_daily.dart';
import 'package:intl/intl.dart';

import '../utilities/forecast_utils.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city.name;
    var country = snapshot.data?.city.country;
    var formatedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black87),
          ),
          Text(
            '${Util.getFormatDate(formatedDate)}',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
