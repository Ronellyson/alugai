import 'package:alugai/shared/themes/app_colors.dart';
import 'package:alugai/shared/themes/app_images.dart';
import 'package:alugai/shared/widgets/list_property_widget/list_events_widget.dart';
import 'package:flutter/material.dart';

import '../../../app/app_repository.dart';
import '../../../app_state.dart';
import '../../models/Immobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var repository = AppRepository();
  late Future<List<Immobile>> _propertys;

  bool hasInternet = true;

  get _appState => AppState();

  @override
  void initState() {
    super.initState();
    _getPropertys();
  }

  _getPropertys() {
    setState(() {
      _propertys = repository.getPropertys();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset(AppImages.logo,scale: 1.5,)),
        shadowColor: AppColors.primary,
      ),
      body: Center(
        child: FutureBuilder<List<Immobile>>(
          future: _propertys,
          builder: (context, snapshot) => Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ListPropertyWidget(
              propertyList: snapshot.data?.toList() ?? [],
              appState: _appState,
            ),
          ),
        ),
      ),
    );
  }
}
