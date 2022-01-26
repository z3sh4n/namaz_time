import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/size_constants.dart';
import '../../domain/entity/sujra_entity.dart';

class SujraSharifCard extends StatelessWidget {
  const SujraSharifCard({
    Key? key,
    required double w,
    required this.sujraSharif,
  })  : _w = w,
        super(key: key);

  final double _w;
  final SujraEntity sujraSharif;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Stack(
                children: [
                  SizedBox(
                    width: 105.w,
                    child: const ColoredBox(
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    sujraSharif.image,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Text(
              sujraSharif.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.all(Sizes.dimen_10),
      margin: EdgeInsets.only(bottom: _w / Sizes.dimen_20),
      height: _w / 3.5,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
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
