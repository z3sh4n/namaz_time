import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namaz_time/core/theme/theme_color.dart';
import 'package:namaz_time/core/theme/themes.dart';
import 'package:namaz_time/features/notification_remain_time/timer_bloc/timer_bloc.dart';

import '../../../notification_remain_time/controller/time_ticker_controller.dart';

class CoundownTimerWidget extends StatefulWidget {
  const CoundownTimerWidget({
    Key? key,
  }) : super(key: key);

  @override
  _CoundownTimerWidgetState createState() => _CoundownTimerWidgetState();
}

class _CoundownTimerWidgetState extends State<CoundownTimerWidget> {
  late final Timer timer;
  @override
  void didChangeDependencies() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      BlocProvider.of<TimerCubit>(context).timeTicker();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: kAnimationDuration,
          reverseDuration: Duration.zero,
          switchInCurve: kAnimationCurve,
          child: state is! TimerLoaded
              ? const SizedBox()
              : Text(
                  convertDurationCountdown(state.difference),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: kLightTextColor),
                ),
        );
      },
    );
  }
}
