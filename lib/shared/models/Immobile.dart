// ignore_for_file: file_names

import 'package:alugai/shared/models/Coordinates.dart';

class Immobile {
  final int propertyId;
  final String title;
  final String imagePath;
  final String description;
  final String propertyType;
  final String city;
  final String state;
  final Coordinates coordinates;
  final String value;

  Immobile(
      {required this.propertyId,
      required this.title,
      required this.imagePath,
      required this.description,
      required this.propertyType,
      required this.city,
      required this.state,
      required this.coordinates,
      required this.value});

  factory Immobile.fromJson(Map<String, dynamic> json) {
    return Immobile(
      propertyId: json["imovelId"] as int,
      title: json["title"] as String,
      imagePath: json["imagePath"] as String,
      description: json["description"] as String,
      propertyType: json["propertyType"] as String,
      city: json["city"] as String,
      state: json["state"] as String,
      coordinates: Coordinates(
        latitude: json["latitude"] as double,
        longitude: json["longitude"] as double,
      ),
      value: json["value"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "propertylId": propertyId,
        "title": title,
        "imagePath": imagePath,
        "description": description,
        "propertyType": propertyType,
        "city": city,
        "state": state,
        "coordinates": coordinates,
        "value": value,
      };

  static List<Immobile>? fromJsonList(List list) {
    return list.map((evento) => Immobile.fromJson(evento)).toList();
  }
}
