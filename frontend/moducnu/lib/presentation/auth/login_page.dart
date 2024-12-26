import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moducnu/navigation/main_navigation_page.dart';
import 'package:moducnu/presentation/common/custom_btn.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:sizing/sizing.dart';
import '../../di/auth_di.dart';
import 'login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  final LoginViewModel loginViewModel = getIt<LoginViewModel>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController memberIdController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '로그인',
                style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 5),
              Text(
                '환영합니다 🎉',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              SizedBox(height: 0.05.sh),
              _buildTextField(
                controller: memberIdController,
                labelText: '사용자 ID',
                hintText: '사용자 ID를 입력하세요.',
              ),
              SizedBox(height: 0.02.sh),
              _buildTextField(
                controller: passwordController,
                labelText: '비밀번호',
                hintText: '비밀번호를 입력하세요.',
                isObscure: true,
              ),
              SizedBox(height: 0.17.sh),
              Center(
                child: Obx(() {
                  return CustomButton(
                    label: loginViewModel.isLoading.value ? '로그인 중...' : '로그인하기',
                    onPressed: () {
                      loginViewModel.login(
                        memberIdController.text,
                        passwordController.text,
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: 0.02.sh),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const MainNavigationPage());
                  },
                  child: const Text(
                    '회원 가입하기',
                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool isObscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            hintText: hintText,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}