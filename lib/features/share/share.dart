import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareInfo extends StatelessWidget {
  const ShareInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          ShareAppBtn(),
          ShareCustomBtns(
            iconData: Icons.ac_unit,
            text: 'Rate & Feedback',
            url: "https://pub.dev/packages/share_plus",
          ),
        ],
      ),
    );
  }
}

class ShareCustomBtns extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final String? url;
  const ShareCustomBtns({
    Key? key,
    required this.iconData,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                iconData,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                "  $text",
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          onPressed: () => launch("$url"),
        ),
      ),
    );
  }
}

class ShareAppBtn extends StatefulWidget {
  const ShareAppBtn({Key? key}) : super(key: key);

  @override
  _ShareAppBtnState createState() => _ShareAppBtnState();
}

class _ShareAppBtnState extends State<ShareAppBtn> {
  String text = "Hello this is test i will implement playstore link\n\n"
      "here will be link \n\nShare More! :)";

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;

    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.share,
                  size: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                ),
                const Text(
                  "  Invite Friends",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            onPressed: () => share(context)),
      ),
    );
  }
}
