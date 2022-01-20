import 'package:equatable/equatable.dart';

class NamazParams extends Equatable {
  final double lat;
  final double lang;

  const NamazParams(this.lat, this.lang);

  @override
  List<Object?> get props => [lat, lang];
}
