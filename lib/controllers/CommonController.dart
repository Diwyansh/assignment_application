import 'dart:convert';

import 'package:assignment_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginFormController extends GetxController {
  bool _isNameValidate = false;
  bool _isPasswordValidate = false;

  String? _nameError;
  String? _passwordError;

  late String _userName;
  late String _password;

  String get userName => _userName;

  String get password => _password;

  String? get passwordError => _passwordError;

  String? get nameError => _nameError;

  bool get isNameValidate => _isNameValidate;

  bool get isPasswordValidate => _isPasswordValidate;

  setPasswordError(String? value) {
    _passwordError = value;
    update();
  }

  setNameError(String? value) {
    _nameError = value;
    update();
  }

  setUserName(String value) {
    _userName = value;
    if (value.length == 0) {
      setNameError(null);
      _isNameValidate = false;
    } else if (value.length < 3) {
      setNameError("Minimum 3 Characters Are Required");
      _isNameValidate = false;
    } else if (value.length > 11) {
      setNameError("Maximum 11 Characters Are Allowed");
      _isNameValidate = false;
    } else {
      setNameError(null);
      _isNameValidate = true;
    }
    update();
  }

  setPassword(String value) {
    _password = value;
    if (value.length == 0) {
      setPasswordError(null);
      _isPasswordValidate = false;
    } else if (value.length < 3) {
      setPasswordError("Minimum 3 Characters Are Required");
      _isPasswordValidate = false;
    } else if (value.length > 11) {
      setPasswordError("Maximum 11 Characters Are Allowed");
      _isPasswordValidate = false;
    } else {
      setPasswordError(null);
      _isPasswordValidate = true;
    }
    update();
  }

  loginUser(String email, String password) async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    final box = GetStorage();
    String url = "https://reqres.in/api/login";
    Uri uri = Uri.parse(url);

    final response = await http.post(uri, body: {
      "email": email == "9876543210" ? "eve.holt@reqres.in" : email,
      "password": password
    });

    if (response.statusCode == 200) {
      Get.back();
      Get.showSnackbar(GetBar(
        message: "LoggedIn Successfully",
      ));
      box.write("isLoggedIn", "true");
      Get.to(() => HomeScreen());
    } else {
      Get.back();
      Get.showSnackbar(GetBar(
        message: "Email or Password is incorrect. Please try again.",
      ));
    }
  }
}
