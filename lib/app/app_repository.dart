import 'package:alugai/shared/models/Coordinates.dart';

import '../shared/models/Immobile.dart';

class AppRepository {
  Future<List<Immobile>> getPropertys() async {
    List<Immobile> propertyList = [
      Immobile(
          propertyId: 1,
          title: 'Casa (2 quartos)',
          imagePath: 'https://api.lorem.space/image/house?w=640&amp;amp;amp;amp;h=480',
          description: """Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. 
In tincidunt rutrum placerat.""",
          propertyType: 'Casa',
          city: 'Rio tinto',
          state: 'Paraíba',
          coordinates: Coordinates(latitude: -6.8069537, longitude: -35.0865899),
          value: '200.00'),
          Immobile(
          propertyId: 2,
          title: 'Apartamento (2 quartos)',
          imagePath: 'https://api.lorem.space/image/house?w=640&amp;amp;amp;amp;h=480',
          description: """Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. 
In tincidunt rutrum placerat.""",
          propertyType: 'Casa',
          city: 'Mamanguape',
          state: 'Paraíba',
          coordinates: Coordinates(latitude: -6.8069537, longitude: -35.0865899),
          value: '400.00'),
          Immobile(
          propertyId: 3,
          title: 'Apartamento (3 quartos)',
          imagePath: 'https://api.lorem.space/image/house?w=640&amp;amp;amp;amp;h=480',
          description: """Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. 
In tincidunt rutrum placerat.""",
          propertyType: 'Casa',
          city: 'Rio tinto',
          state: 'Paraíba',
          coordinates: Coordinates(latitude: -6.8069537, longitude: -35.0865899),
          value: '300.00'),
          Immobile(
          propertyId: 4,
          title: 'Casa (4 quartos)',
          imagePath: 'https://api.lorem.space/image/house?w=640&amp;amp;amp;amp;h=480',
          description: """Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. 
In tincidunt rutrum placerat.""",
          propertyType: 'Casa',
          city: 'Mamanguape',
          state: 'Paraíba',
          coordinates: Coordinates(latitude: -6.8069537, longitude: -35.0865899),
          value: '500.00'),
    ];

    return propertyList;
  }
}
