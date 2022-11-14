import 'package:alugai/shared/themes/app_colors.dart';
import 'package:alugai/shared/themes/app_images.dart';
import 'package:alugai/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 56,
            width: (MediaQuery.maybeOf(context)?.size.width)! < 580
                ? ((MediaQuery.maybeOf(context)?.size.width)! * 0.8)
                : 400,
            decoration: BoxDecoration(
                color: AppColors.shape,
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.google),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 56,
                        width: 1,
                        color: AppColors.stroke,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Entrar com Google",
                        style: TextStyles.buttonGray,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
