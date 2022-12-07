import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:alugai/app_state.dart';
import '../../models/Immobile.dart';
import 'package:alugai/shared/widgets/property_widget/property_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListPropertyWidget extends StatefulWidget {
  const ListPropertyWidget(
      {super.key, required this.propertyList, required this.appState});

  final List<Immobile> propertyList;
  final AppState appState;

  @override
  State<ListPropertyWidget> createState() =>
      _ListPropertyWidgetState(propertyList, appState);
}

class _ListPropertyWidgetState extends State<ListPropertyWidget> {
  _ListPropertyWidgetState(List<Immobile> propertyList, AppState appState);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [getPropertys(widget.propertyList)]);
  }

  Widget getPropertys(List<Immobile> propertys) {
    return Column(children: propertys.map((property) =>
            PropertyWidget(property: property, appState: widget.appState)).toList());
  }
}
