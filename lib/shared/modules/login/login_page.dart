// ignore_for_file: unnecessary_import, library_private_types_in_public_api

import 'package:alugai/shared/modules/login/login_controller.dart';
import 'package:alugai/shared/themes/app_colors.dart';
import 'package:alugai/shared/themes/app_images.dart';
import 'package:alugai/shared/widgets/social_login/social_login_button.dart';
import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.background),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight),
              ),
              child: AnimatedCard(
                direction: AnimatedCardDirection.top,
                child: SocialLoginButton(
                  onTap: () {
                    controller.googleSignIn(context);
                  },
                ),
              ),
            ),
            Center(child: Image.asset(AppImages.logoFull)),
          ],
        ));
  }
}
