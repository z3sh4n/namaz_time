import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdfsdf/core/util/loading.dart';
import 'package:sdfsdf/features/location/presentation/cubit/location_cubit.dart';

import '../blocs/angle_bloc/angle_bloc.dart';
import '../blocs/qibla_bloc/qibla_bloc.dart';
import '../controller/qibla_controller.dart';
import 'compass.dart';

class QiblaScaffold extends StatefulWidget {
  const QiblaScaffold({Key? key}) : super(key: key);

  @override
  State<QiblaScaffold> createState() => _QiblaScaffoldState();
}

class _QiblaScaffoldState extends State<QiblaScaffold> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<QiblaBloc>(context).add(
      RequestQiblahDirection(
        BlocProvider.of<LocationCubit>(context).state,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Qiblah Direction',
        ),
      ),
      body: BlocBuilder<QiblaBloc, QiblaState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            reverseDuration: Duration.zero,
            switchInCurve: Curves.easeInOut,
            child: (state is QiblaLoading)
                ? const LoadingWidget()
                : (state is QiblaLoaded)
                    ? SafeArea(
                        child: Container(
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 32.h,
                                  ),
                                  const Text('Qiblah direction is '),
                                  Text(
                                    '${state.direction.toStringAsFixed(0)}°',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    getDirectionText(
                                      state.direction.floor(),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: BlocProvider.value(
                                  value: AngleBloc(state.direction),
                                  child: const Compass(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : (state is QiblaFailed)
                        ? const SafeArea(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                            // child: FailureWidget(
                            //   state.failure,
                            //   () {
                            //     context.read<LocationCubit>().initLocaiton();
                            //   },
                            //   withAppbar: true,
                            // ),
                          )
                        : Container(),
          );
        },
      ),
    );
  }
}
