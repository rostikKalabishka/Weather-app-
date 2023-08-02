class Constants {
  static const String WEATHER_APP_ID = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const String WEATHER_BASE_SCHEME = 'https://';
  static const String WEATEHR_BASE_URL_DOMAIN = 'api.openweathermap.org';
  static const String WEATHER_FORECAST_PATH = '/data/2.5/forecast/daily';
  static const String WEATHER_IMAGE_PATH = '/img/w/';
  static const String WEATHER_IMAGE_URL =
      WEATHER_BASE_SCHEME + WEATEHR_BASE_URL_DOMAIN + WEATHER_IMAGE_PATH;
  //api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}&appid={API key}
}
