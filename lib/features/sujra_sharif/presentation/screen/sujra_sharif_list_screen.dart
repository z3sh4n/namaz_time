import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sdfsdf/core/theme/size_constants.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/entity/sujra_entity.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/widgets/sujra_sharif_card.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/screen/sujra_sharif_detail_screen.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/widgets/sujra_sharif_detail_card.dart';

class SujraListScreen extends StatelessWidget {
  final SujraEntity sujraEntity;
  const SujraListScreen({
    Key? key,
    required this.sujraEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(sujraEntity.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: sujraEntity.data.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 2500),
                child: GestureDetector(
                  child: OpenContainer(
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    transitionDuration: const Duration(milliseconds: 500),
                    closedElevation: Sizes.dimen_0,
                    closedBuilder: (ctx, _) {
                      return SujraSharifDetailCard(
                        w: _w,
                        sujraSharif: sujraEntity.data[index],
                      );
                    },
                    openBuilder: (ctx, _) {
                      return SujraDetailScreen(
                          sujraSharif: sujraEntity.data[index]);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
