import 'package:flutter/material.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_detail_entity.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';

class SujraDetailScreen extends StatelessWidget {
  final SujraDetailEntity sujraSharif;
  const SujraDetailScreen({Key? key, required this.sujraSharif})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sujra detail ${sujraSharif.title}'),
      ),
      body: Container(),
    );
  }
}
