import 'dart:developer';

import 'package:mobiledevtest/app/logic/network_config.dart';
import 'package:mobiledevtest/core/authentication/data%20source/auth_datasource.dart';

class AuthImple extends AuthDataSource {
  final dio = NetworkConfig.dio;

  @override
  Future<Map<String, dynamic>> signIn(Map<String, dynamic> data) async {
    try {
      log("Sign in initated");
      log(dio.options.baseUrl);
      final response = await dio.post("login", data: data);

      log("Sign in response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw response.data;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
