import 'package:alugai/shared/modules/property_details/property_details_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_state.dart';
import '../../models/Immobile.dart';

class PropertyDetailsPage extends StatelessWidget {
  final Immobile property;
  final AppState appState;

  const PropertyDetailsPage(
      {Key? key, required this.property, required this.appState})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Immobile>.value(
        value: property,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //EventDetailsBackground(),
            PropertyDetailsContent(appState: appState),
          ],
        ),
      ),
    );
  }
}
