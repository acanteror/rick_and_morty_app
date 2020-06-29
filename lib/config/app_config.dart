import 'package:meta/meta.dart';

class AppConfig {
  String _apiHost;

  AppConfig._internal();
  static final AppConfig _instance = AppConfig._internal();
  static AppConfig get instance => _instance;

  String get apiHost => _apiHost;

  void init({@required String apiHost}) {
    this._apiHost = apiHost;
  }
}
