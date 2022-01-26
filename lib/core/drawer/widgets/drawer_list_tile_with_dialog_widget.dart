import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'drawer_list_tile_widget.dart';

class DrawerListTileWithDialog extends StatelessWidget {
  final String title;
  final List<Widget> listWidget;
  final IconData icon;

  const DrawerListTileWithDialog({
    Key? key,
    required this.title,
    required this.listWidget,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerListTile(
      title: title,
      onTap: () {
        Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  content: SizedBox(
                    height: 120.h,
                    child: Column(
                      children: listWidget,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ));
      },
      icon: icon,
    );
  }
}
