import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/login/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Text('Login'),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'foo@bar.com',
              ),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'qwerty123',
              ),
            ),
            GetBuilder<LoginController>(builder: (context) {
              if (controller.loginModel.value.isLoading == true) {
                return const CircularProgressIndicator();
              }
              return MaterialButton(
                onPressed: () {
                  controller.doLogin();
                },
                child: const Text('Login'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
