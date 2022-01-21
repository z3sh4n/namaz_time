import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../location/presentation/cubit/location_cubit.dart';

import '../../../dependency_injection.dart';
import '../blocs/qibla_bloc/qibla_bloc.dart';
import '../widget/qibla_screen_scaffold.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  late QiblaBloc qiblaBloc;
  late LocationCubit locationBloc;

  @override
  void initState() {
    super.initState();
    locationBloc = sl<LocationCubit>();
    qiblaBloc = sl<QiblaBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    locationBloc.close();
    qiblaBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => qiblaBloc,
        ),
        BlocProvider<LocationCubit>.value(
          value: locationBloc,
        )
      ],
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          // print(state);
          if (state is LocationLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const QiblaScaffold();
        },
      ),
    );
  }
}
