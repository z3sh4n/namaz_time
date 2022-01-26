import 'dart:convert';

import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final String latitude;
  final String longitude;

  const LocationModel({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [longitude,latitude];

 
}
