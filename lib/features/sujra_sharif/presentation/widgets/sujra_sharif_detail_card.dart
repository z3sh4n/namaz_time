import 'package:flutter/material.dart';
import '../../../../core/theme/size_constants.dart';
import '../../domain/entity/sujra_detail_entity.dart';

class SujraSharifDetailCard extends StatelessWidget {
  const SujraSharifDetailCard({
    Key? key,
    required double w,
    required this.sujraSharif,
  })  : _w = w,
        super(key: key);

  final double _w;
  final SujraDetailEntity sujraSharif;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sujraSharif.eDetailTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6,
          ),
          // Text(
          //   sujraSharif.data,
          //   maxLines: 3,
          //   overflow: TextOverflow.ellipsis,
          //   style: Theme.of(context).textTheme.caption,
          // )
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
