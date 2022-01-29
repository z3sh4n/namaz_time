import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:namaz_time/core/util/routes.dart';
import 'package:namaz_time/features/share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/drawer_list_tile_widget.dart';
import 'widgets/drawer_list_tile_with_dialog_widget.dart';

class Drawerx extends StatefulWidget {
  const Drawerx({Key? key}) : super(key: key);

  @override
  _DrawerxState createState() => _DrawerxState();
}

class _DrawerxState extends State<Drawerx> {
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Image.asset(
            'assets/sujra_sharif_logos/Akhtar_raza_khan.png',
            fit: BoxFit.cover,
          )),
          DrawerListTile(
            title: 'Dua',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(RouteGenerator.duaScreen);
            },
            icon: Icons.directions_run_sharp,
          ),
          DrawerListTile(
            icon: Icons.star,
            title: 'Review our App',
            onTap: () async {
              Navigator.of(context).pop();
              if (await inAppReview.isAvailable()) {
                inAppReview.requestReview();
              } else {
                launch("https://pub.dev/packages/share_plus");
              }
            },
          ),
          const DrawerListTileWithDialog(
            listWidget: [ShareInfo()],
            title: 'Share/Rate us',
            icon: Icons.share,
          ),
          const DrawerListTileWithDialog(
            listWidget: [Text('Coming Soon')],
            title: 'Contact us',
            icon: Icons.people,
          ),
          DrawerListTile(
            title: 'Donate Us',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(RouteGenerator.donateUsScreen);
            },
            icon: Icons.monetization_on,
          ),
          const DrawerListTileWithDialog(
            title: 'About us',
            listWidget: [Text('Coming Soon')],
            icon: Icons.info,
          ),
        ],
      ),
    );
  }
}
