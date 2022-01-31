import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namaz_time/core/util/loading_indicator.dart';
import 'package:namaz_time/features/location/location_cubit/location_cubit.dart';
import 'package:namaz_time/features/namaz_time/presentation/widgets/theme_toggle_button.dart';

import '../../../notification_remain_time/controller/notification_controller.dart';
import '../widgets/namaz_list_widget.dart';
import '../widgets/top_card_widget.dart';

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
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ThemeToggleButton(),
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
            return const LoadingIndicator();
          },
        ),
      ),
    );
  }
}

