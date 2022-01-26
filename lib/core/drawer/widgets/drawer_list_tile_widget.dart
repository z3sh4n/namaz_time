import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final IconData icon;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      leading: Icon(icon),
    );
  }
}
