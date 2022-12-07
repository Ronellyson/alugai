import 'package:url_launcher/url_launcher.dart';

import '../shared/models/Immobile.dart';
class GoogleMapUtils {

  GoogleMapUtils._();

  static Future<void> launchMapsUrl(Immobile property) async {
    Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=${property.coordinates.latitude},${property.coordinates.longitude}');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not launch $googleUrl';
    }
  }
}