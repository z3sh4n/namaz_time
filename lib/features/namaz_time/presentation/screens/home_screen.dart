import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdfsdf/core/theme/theme_bloc/theme_bloc.dart';
import 'package:sdfsdf/features/location/presentation/cubit/location_cubit.dart';
import 'package:sdfsdf/features/namaz_time/presentation/widgets/change_theme_switch.dart';
import 'package:sdfsdf/features/namaz_time/presentation/widgets/top_card.dart';
import 'package:sdfsdf/features/notification_remain_time/controller/notification_controller.dart';

import '../../../../dependency_injection.dart';
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return ChangeThemeSwitch(
                      value: state.currentTheme.brightness == Brightness.dark,
                      onChanged: (_) {
                        BlocProvider.of<ThemeBloc>(context).add(
                          ToggleTheme(),
                        );
                      });
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
