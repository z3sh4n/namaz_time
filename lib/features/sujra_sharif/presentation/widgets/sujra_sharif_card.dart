import 'package:flutter/material.dart';

import '../../../../core/theme/size_constants.dart';
import '../../../../core/theme/theme_color.dart';

class SujraSharifCard extends StatelessWidget {
  const SujraSharifCard({
    Key? key,
    required double w,
    required this.sujraSharifTitle,
    this.sujraSharifImage,
  })  : _w = w,
        super(key: key);

  final double _w;
  final String sujraSharifTitle;
  final String? sujraSharifImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          sujraSharifImage != null
              ? Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        sujraSharifImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          Expanded(
            child: Text(
              sujraSharifTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: kLightTextColor),
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.all(Sizes.dimen_10),
      margin: EdgeInsets.only(bottom: _w / Sizes.dimen_20),
      height: _w / 3.5,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          transform: GradientRotation(5),
          colors: [
            kLightPrimary,
            kLightAccent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: Sizes.dimen_10,
            spreadRadius: Sizes.dimen_4,
          ),
        ],
      ),
    );
  }
}
