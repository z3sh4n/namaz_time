import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sdfsdf/core/theme/size_constants.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/cubit/sujrasharif_cubit.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/widgets/sujra_sharif_card.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/screen/sujra_sharif_detail_screen.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/screen/sujra_sharif_list_screen.dart';

import '../../../../dependency_injection.dart';

class SujraSharifScreen extends StatefulWidget {
  const SujraSharifScreen({Key? key}) : super(key: key);

  @override
  State<SujraSharifScreen> createState() => _SujraSharifScreenState();
}

class _SujraSharifScreenState extends State<SujraSharifScreen> {
  late SujraSharifCubit sujraSharifCubit;

  @override
  void initState() {
    super.initState();
    sujraSharifCubit = sl<SujraSharifCubit>();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => sujraSharifCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sujra Sharif"),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: AnimationLimiter(
          child: BlocBuilder<SujraSharifCubit, SujraSharifState>(
            builder: (context, state) {
              context.watch<SujraSharifCubit>().getSujraSharifListf();
              if (state is SujraSharifLoaded) {
                return ListView.builder(
                  padding: EdgeInsets.all(_w / 30),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: state.listSujraEntity.length,
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
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              closedElevation: Sizes.dimen_0,
                              closedBuilder: (ctx, _) {
                                return SujraSharifCard(
                                  w: _w,
                                  sujraSharif: state.listSujraEntity[index],
                                );
                              },
                              openBuilder: (ctx, _) {
                                return SujraListScreen(
                                    sujraEntity: state.listSujraEntity[index]);
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
