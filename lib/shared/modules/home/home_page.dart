// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, implementation_imports, unnecessary_import

import 'package:alugai/shared/themes/app_colors.dart';
import 'package:alugai/shared/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.primary,
      ),
      body: Center(
        child: Container(
          child: Text(
            'Autenticado',
            style: TextStyles.titleHome,
          ),
        ),
      ),
    );
  }
}
