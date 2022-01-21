import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/util/navigation_bar.dart';
import 'core/theme/theme_bloc/theme_bloc.dart';
import 'dependency_injection.dart' as sl;
import 'features/location/presentation/cubit/location_cubit.dart';
import 'features/notification_remain_time/services/notification_service.dart';
import 'features/qiblah_direction/blocs/qibla_bloc/qibla_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  unawaited(sl.init());
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LocationCubit locationBloc;
  late QiblaBloc qiblaBloc;

  @override
  void initState() {
    super.initState();
    locationBloc = sl.sl<LocationCubit>();
    qiblaBloc = sl.sl<QiblaBloc>();
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
          create: (context) => locationBloc,
        ),
        BlocProvider(
          create: (context) => qiblaBloc,
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          builder: () =>
              BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: state.currentTheme,
                  home: const BottomNav3(),
                );
              })),
    );
  }
}
