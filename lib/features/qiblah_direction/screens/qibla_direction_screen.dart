import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:namaz_time/core/util/loading_indicator.dart';
import 'package:namaz_time/features/qiblah_direction/widgets/qiblah_compass.dart';
import 'package:namaz_time/features/qiblah_direction/widgets/unsupported_device_widget.dart';

class QiblaDirectionScreen extends StatefulWidget {
  const QiblaDirectionScreen({Key? key}) : super(key: key);

  @override
  _QiblaDirectionScreenState createState() => _QiblaDirectionScreenState();
}

class _QiblaDirectionScreenState extends State<QiblaDirectionScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qibla Direction'),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }

          if (snapshot.data!) {
            return const QiblahCompass();
          } else {
            return const UnsupportedDeviceQiblaDirectionWidget();
          }
        },
      ),
    );
  }
}
