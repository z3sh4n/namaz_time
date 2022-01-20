import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdfsdf/features/location/presentation/cubit/location_cubit.dart';
import 'package:sdfsdf/features/namaz_time/presentation/cubit/namaz_time_cubit.dart';

import '../../../../dependency_injection.dart';

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
    return BlocProvider<NamazTimeCubit>(
      create: (context) => namazTimeBloc,
      child: BlocBuilder<NamazTimeCubit, NamazTimeState>(
          builder: (context, state) {
        context.read<NamazTimeCubit>().requestNamazTime(
              widget.locationState.latitude,
              widget.locationState.longitude,
            );
        if (state is NamazTimeLoaded) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.namazTimeList.length,
            itemBuilder: (context, index) => Card(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(15)),
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
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      state.namazTimeList[index].namazTime,
                      maxLines: 1,
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
