import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:showwcase_pokemob/features/login/login.controller.dart';

void main() {
  testWidgets('LoginController should update loginModel on email change', (WidgetTester tester) async {
    // Create an instance of LoginController
    LoginController loginController = LoginController();

    // Build a test widget to use GetBuilder and access the controller
    await tester.pumpWidget(
      GetMaterialApp(
        home: GetBuilder<LoginController>(
          init: loginController,
          builder: (_) => Container(),
        ),
      ),
    );

    // Simulate changing the email value
    String newEmail = 'test@example.com';
    loginController.onEmailChange(newEmail);

    // Verify that the loginModel has been updated with the new email value
    expect(loginController.loginModel.value.email, equals(newEmail));
  });

  testWidgets('LoginController should update loginModel on password change', (WidgetTester tester) async {
    // Create an instance of LoginController
    LoginController loginController = LoginController();

    // Build a test widget to use GetBuilder and access the controller
    await tester.pumpWidget(
      GetMaterialApp(
        home: GetBuilder<LoginController>(
          init: loginController,
          builder: (_) => Container(),
        ),
      ),
    );

    // Simulate changing the password value
    String newPassword = 'password123';
    loginController.onPasswordChange(newPassword);

    // Verify that the loginModel has been updated with the new password value
    expect(loginController.loginModel.value.password, equals(newPassword));
  });

  testWidgets('LoginController should navigate to /home after login', (WidgetTester tester) async {
    // Create an instance of LoginController
    LoginController loginController = LoginController();

    // Build a test widget to use Get.toNamed and access the controller
    await tester.pumpWidget(
      GetMaterialApp(
        home: GetBuilder<LoginController>(
          init: loginController,
          builder: (_) => Container(),
        ),
      ),
    );

    // Trigger the login process
    loginController.doLogin();

    // Wait for 2 seconds (simulating the delay)
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify that the navigation to /home occurred
    expect(Get.currentRoute, '/home');
  });
}
