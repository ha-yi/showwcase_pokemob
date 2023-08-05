import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/app/locale/keys.locale.dart';
import 'package:showwcase_pokemob/features/login/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Words.loginTitle.tr,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: Words.email.tr,
                hintText: 'foo@bar.com',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: Words.password.tr,
                hintText: 'qwerty123',
              ),
            ),
            const SizedBox(height: 24),
            Obx(() {
              if (controller.loginModel.value.isLoading == true) {
                return const CircularProgressIndicator();
              }
              return Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.lightBlue,
                      onPressed: () {
                        controller.doLogin();
                      },
                      child: Text(Words.loginButton.tr),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
