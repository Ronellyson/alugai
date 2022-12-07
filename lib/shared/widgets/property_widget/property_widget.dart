import 'dart:ui';

import 'package:alugai/shared/themes/app_colors.dart';
import 'package:alugai/shared/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../app_state.dart';
import '../../models/Immobile.dart';
import '../../modules/property_details/property_details_page.dart';
import '../../themes/app_images.dart';

class PropertyWidget extends StatelessWidget {
  final Immobile property;
  final AppState appState;

  const PropertyWidget(
      {Key? key, required this.property, required this.appState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                PropertyDetailsPage(property: property, appState: appState),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: AppColors.stroke,
              offset: Offset(0, 2),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.secondary,
                          ],
                        ),
                      ),
                      child: FadeInImage.assetNetwork(
                        image: property.imagePath,
                        width: MediaQuery.of(context).size.width,
                        height: 125,
                        fit: BoxFit.cover,
                        placeholder: AppImages.placeholder,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 16,
                  right: 16,
                  bottom: 8,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            property.title,
                            style: TextStyles.titleListTile,
                          ),
                          SizedBox(height: 5),
                          FittedBox(
                            child: Material(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.solidCompass,
                                    size: 15,
                                    color: TextStyles.titleListTile.color
                                  ),
                                  SizedBox(width: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Text(
                                      ('${property.city}, ${property.state}'),
                                      style:TextStyles.titleListTile,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom(IconData icon, Color colorPrimary, Color colorSecundary,
      BuildContext context) {
    return IconButton(
      icon: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            colorPrimary,
            colorSecundary,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds),
        child: Container(
          margin: EdgeInsets.all(1),
          child: FaIcon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () {
        if (icon == FontAwesomeIcons.comment) () => {};
      },
    );
  }
}
