import 'package:dio/dio.dart';

class NetworkConfig {
  static final NetworkConfig _instance = NetworkConfig._internal();

  static Dio dio = Dio();
  factory NetworkConfig() {
    return _instance;
  }

  NetworkConfig._internal();

  static initNetworkConfig() {
    dio = Dio(BaseOptions(
      baseUrl: "https://core.development.4traderx.com/",
      connectTimeout: 60000,
      receiveTimeout: 60000,
    ));
  }
}
