import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namaz_time/core/theme/size_constants.dart';
import 'package:namaz_time/core/theme/theme_color.dart';
import 'package:namaz_time/core/util/loading_indicator.dart';
import 'package:namaz_time/features/location/location_cubit/location_cubit.dart';

import '../../../../dependency_injection.dart';
import '../cubit/namaz_time_cubit.dart';

class PrayerTimeList extends StatefulWidget {
  final LocationState locationState;

  const PrayerTimeList({
    Key? key,
    required this.locationState,
  }) : super(key: key);

  @override
  _PrayerTimeListState createState() => _PrayerTimeListState();
}

class _PrayerTimeListState extends State<PrayerTimeList> {
  late NamazTimeCubit namazTimeBloc;
  @override
  void initState() {
    super.initState();
    namazTimeBloc = sl<NamazTimeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    String convertTimeTo12HourFormat(String timing) {
      int hour = int.parse(timing.split(':')[0]);
      final int min = int.parse(timing.split(':')[1]);
      String minInString = min.toString();
      String amPm = 'AM';

      if (hour >= 12) {
        amPm = 'PM';
      }

      if (hour > 12) {
        hour -= 12;
      }

      if (min < 10) {
        minInString = '0$min';
      }

      return '$hour:$minInString $amPm';
    }

    return BlocBuilder<NamazTimeCubit, NamazTimeState>(
        builder: (context, state) {
      context.read<NamazTimeCubit>().requestNamazTime(
            widget.locationState.latitude,
            widget.locationState.longitude,
          );
      if (state is NamazTimeLoaded) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.namazTimeList.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: Sizes.dimen_4,
                      offset: Offset(
                        Sizes.dimen_1,
                        Sizes.dimen_2,
                      ))
                ],
                color: Theme.of(context).bottomAppBarColor
                // gradient: const LinearGradient(
                //   colors: [
                //     kLightPrimary,
                //     kLightPrimary,
                //   ],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                ),
            margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.namazTimeList[index].namazName,
                    maxLines: 1,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: kLightPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                    // .copyWith(color: Colors.black),
                  ),
                  Text(
                    convertTimeTo12HourFormat(
                        state.namazTimeList[index].namazTime),
                    maxLines: 1,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: kLightPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return const LoadingIndicator();
    });
  }
}
