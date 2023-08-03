import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/model/login.model.dart';

class LoginController extends GetxController {
  Rx<LoginModel> loginModel = LoginModel().obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onEmailChange(String value) {
    loginModel.value = loginModel.value.copyWith(email: value);
  }

  void onPasswordChange(String value) {
    loginModel.value = loginModel.value.copyWith(password: value);
  }

  void doLogin() {
    loginModel.value = loginModel.value.copyWith(isLoading: true);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAllNamed('/home');
    });
  }
}
