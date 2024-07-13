import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/env/env_enviroment.dart';
import 'package:http/http.dart' as http;

class LocationUtil {
  static String generateLocationPreviewImage({
    double latitude = 0.0,
    double longitude = 0.0,
  }) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${AppEnviroment.GOOGLE_API_KEY}";
  }

  static Future<String> getAddressFrom(LatLng postion) async {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${postion.latitude},${postion.longitude}&key=${AppEnviroment.GOOGLE_API_KEY}";

    final response = await http.get(Uri.parse(url));

    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
