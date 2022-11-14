import 'package:alugai/shared/auth/auth_controller.dart';
import 'package:alugai/shared/themes/app_colors.dart';
import 'package:alugai/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background),
                fit: BoxFit.cover,
                alignment: Alignment.centerRight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(AppImages.logoFull),
              ),
              CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ],
          )),
    );
  }
}
