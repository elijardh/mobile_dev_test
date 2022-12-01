import 'package:flutter/cupertino.dart';
import 'package:mobiledevtest/app/logic/resource.dart';
import 'package:mobiledevtest/core/authentication/data%20source/auth_datasource.dart';
import 'package:mobiledevtest/core/authentication/repository/auth_implementation.dart';

class AuthViewmodel extends ChangeNotifier {
  AuthDataSource source = AuthImple();

  Resource<Map<String, dynamic>> _signInResource = Resource.idle();
  Resource<Map<String, dynamic>> get signInResource => _signInResource;

  Future<void> signIn(Map<String, dynamic> data) async {
    try {
      _signInResource = Resource.loading();
      notifyListeners();

      final response = await source.signIn(data);

      _signInResource = Resource.success(response);

      notifyListeners();
    } catch (e) {
      _signInResource = Resource.failed(e.toString());
      notifyListeners();
    }
  }
}
