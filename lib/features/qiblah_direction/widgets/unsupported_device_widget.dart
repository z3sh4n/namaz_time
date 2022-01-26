import 'package:flutter/material.dart';

class UnsupportedDeviceQiblaDirectionWidget extends StatelessWidget {
  const UnsupportedDeviceQiblaDirectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Sorry your device does\'nt support compass',
      style: Theme.of(context).textTheme.headline5,
    ));
  }
}
