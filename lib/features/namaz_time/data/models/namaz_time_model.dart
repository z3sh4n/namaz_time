// ignore_for_file: annotate_overrides, overridden_fields

import 'package:namaz_time/features/namaz_time/domain/entities/namaz_time_entity.dart';

class NamazTimeModel extends NamazTimeEntity {
  final String namazName;
  final String namazTime;

  const NamazTimeModel({
    required this.namazName,
    required this.namazTime,
  }) : super(
          namazName: namazName,
          namazTime: namazTime,
        );

  @override
  List<Object> get props => [namazName, namazTime];
}
