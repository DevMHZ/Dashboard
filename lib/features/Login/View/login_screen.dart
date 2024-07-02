import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: loginController.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: loginController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => loginController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      loginController.login(context);
                    },
                    child: Text('Login'),
                  )),
          ],
        ),
      ),
    );
  }
}
