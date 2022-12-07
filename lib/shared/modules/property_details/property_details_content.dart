import 'package:alugai/shared/themes/app_colors.dart';
import 'package:alugai/shared/themes/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../app_state.dart';
import '../../../functions/features_functions.dart';
import '../../models/Immobile.dart';
import '../../../styleguide.dart';

class PropertyDetailsContent extends StatefulWidget {
  final AppState appState;

  const PropertyDetailsContent({Key? key, required this.appState})
      : super(key: key);

  @override
  _PropertyDetailsContentState createState() => _PropertyDetailsContentState();
}

class _PropertyDetailsContentState extends State<PropertyDetailsContent> {
  @override
  Widget build(BuildContext context) {
    final property = Provider.of<Immobile>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            widget.appState.colorPrimary,
                            widget.appState.colorSecundary,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 3,
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: FadeInImage.assetNetwork(
                          image: property.imagePath,
                          width: MediaQuery.of(context).size.width,
                          height: 125,
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/placeholder.png',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 16.0, right: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: lightTheme.primaryColor,
                              size: 20,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowGlow();
                    return false;
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            verticalOffset: 50,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 18),
                              child: Text(
                                property.title,
                                style: TextStyles.titleHome,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 32),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 1,
                                          color: Colors.grey.withOpacity(.5),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/map_icon.png"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        ('${property.city}, ${property.state}'),
                                        style: TextStyles.titleRegular,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (property.description != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sobre o property",
                                          style: TextStyles.titleHome,
                                          textAlign: TextAlign.left,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              
                                              property.description,
                                              style: TextStyles.titleRegular,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: ReadMoreText(
                                property.description,
                                trimLines: 4,
                                colorClickableText:
                                    widget.appState.colorSecundary,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...\nVer mais',
                                trimExpandedText: '\nVer menos',
                                style: propertyDescription.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white38),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Mapa",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(fontSize: 22),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () =>
                                        GoogleMapUtils.launchMapsUrl(property),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "Ver localização",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        SizedBox(width: 8),
                                        FaIcon(
                                          FontAwesomeIcons.angleRight,
                                          color: Theme.of(context).buttonColor,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              width: screenWidth,
                              height: 250,
                              child: FlutterMap(
                                // ignore: unnecessary_new
                                options: new MapOptions(
                                  center: LatLng(
                                    property.coordinates.latitude,
                                    property.coordinates.longitude,
                                  ),
                                  zoom: 15.0,
                                  maxZoom: 17.0,
                                ),
                                children: [
                                  new TileLayer(
                                      urlTemplate:
                                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                      subdomains: ['a', 'b', 'c']),
                                  new MarkerLayer(
                                    markers: [
                                      new Marker(
                                        width: 80.0,
                                        height: 80.0,
                                        point: LatLng(
                                            property.coordinates.latitude,
                                            property.coordinates.longitude),
                                        builder: (ctx) => new Container(
                                          decoration: BoxDecoration(
                                              color: widget
                                                  .appState.colorSecundary
                                                  .withOpacity(0.25),
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(0, 2),
                                                    blurRadius: 2,
                                                  ),
                                                ],
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 3),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                    color: widget.appState
                                                        .colorSecundary,
                                                    shape: BoxShape.circle),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * -0.05,
            width: screenWidth,
            child: AnimationLimiter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: AnimationConfiguration.toStaggeredList(
                  duration: Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: _buildFloatingButton(
                          property,
                          FontAwesomeIcons.comment,
                          Color(0xFF80A2FC),
                          Color(0xFF798CF5)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFloatingButton(Immobile property, IconData icon,
      Color colorPrimary, Color colorSecundary) {
    return FloatingActionButton(
      heroTag: icon.toString(),
      backgroundColor: Theme.of(context).primaryColor,
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [colorPrimary, colorSecundary],
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
        icon == FontAwesomeIcons.comment
            ? Navigator.pushNamed(context, "/chat")
            : () => {};
      },
    );
  }
}
