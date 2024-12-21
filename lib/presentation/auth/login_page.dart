import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_viewmodel.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController accountIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<LoginViewModel>(); // 등록된 ViewModel 가져오기

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          TextField(
            controller: accountIdController,
            decoration: const InputDecoration(labelText: "Account ID"),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.login(accountIdController.text, passwordController.text);
            },
            child: const Text("Login"),
          ),
          Obx(() => Text(viewModel.loginStatus.value)), // 상태 관찰
        ],
      ),
    );
  }
}
