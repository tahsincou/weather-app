class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feelsLike,
    this.pressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] as String?,
      temp: (json['main']["temp"])?.toDouble(),
      wind: (json['wind']["speed"])?.toDouble(),
      humidity: json['main']['humidity'] as int?,
      feelsLike: (json['main']['feels_like'] as num?)?.toDouble(),
      pressure: json['main']['pressure'] as int?,
    );
  }
}
