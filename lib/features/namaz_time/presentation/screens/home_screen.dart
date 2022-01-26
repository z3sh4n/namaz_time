import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdfsdf/core/drawer/drawer.dart';
import 'package:sdfsdf/core/theme/theme_color.dart';
import 'package:sdfsdf/core/theme/themes.dart';
import '../../../../core/theme/theme_bloc/theme_bloc.dart';
import '../../../location/presentation/cubit/location_cubit.dart';
import '../widgets/change_theme_switch.dart';
import '../widgets/top_card.dart';
import '../../../notification_remain_time/controller/notification_controller.dart';

import '../widgets/namaz_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    configureDidReceiveLocalNotificationSubject(context);
    configureSelectNotificationSubject(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/images/svg/drawer.svg',
                  fit: BoxFit.fill,
                  color: Theme.of(context).textTheme.headline4!.color,
                ),
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: kAnimationDuration,
                    curve: kAnimationCurve,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<ThemeBloc>(context).add(
                          ToggleTheme(),
                        );
                      },
                      icon: state.currentTheme == kAppThemeData[AppTheme.dark]!
                          ? SvgPicture.asset(
                              'assets/images/svg/sun1.svg',
                              color: kDarkTextColor,
                            )
                          : SvgPicture.asset(
                              'assets/images/svg/moon1.svg',
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
          title: const Text('Home'),
        ),
        body: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            context.read<LocationCubit>().initLocaiton();
            // print(state);
            if (state is LocationSuccess) {
              return Column(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TopCard(),
                  ),
                  Expanded(
                      flex: 7, child: PrayerTimeList(locationState: state)),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
