import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/cubit/cubit/sujrafb_cubit.dart';
import '../../../../core/theme/size_constants.dart';
import '../../../../dependency_injection.dart';
import '../../domain/entity/sujra_entity.dart';
import 'sujra_sharif_detail_screen.dart';
import '../widgets/sujra_sharif_detail_card.dart';

class SujraListScreen extends StatefulWidget {
  final SujraEntity sujraEntity;
  const SujraListScreen({
    Key? key,
    required this.sujraEntity,
  }) : super(key: key);

  @override
  State<SujraListScreen> createState() => _SujraListScreenState();
}

class _SujraListScreenState extends State<SujraListScreen> {
  // late SujraFBCubit sujraFBCubit;

  // @override
  // void initState() {
  //   super.initState();
  //   sujraFBCubit = sl<SujraFBCubit>();
  // }

  // @override
  // void dispose() {
  //   sujraFBCubit.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sujraEntity.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: widget.sujraEntity.data.length,
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
                    closedColor: Theme.of(context).scaffoldBackgroundColor,
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    transitionDuration: const Duration(milliseconds: 500),
                    closedElevation: Sizes.dimen_0,
                    closedBuilder: (ctx, _) {
                      return SujraSharifDetailCard(
                        w: _w,
                        sujraSharif: widget.sujraEntity.data[index],
                      );
                    },
                    openBuilder: (ctx, _) {
                      return BlocProvider<SujraFBCubit>(
                        create: (context) => sl<SujraFBCubit>(),
                        child: SujraDetailScreen(
                            image: widget.sujraEntity.image,
                            sujraSharif: widget.sujraEntity.data[index]),
                      );
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
