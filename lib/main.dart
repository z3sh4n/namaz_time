import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sdfsdf/core/util/routes.dart';
import 'core/theme/theme_bloc/theme_bloc.dart';
import 'dependency_injection.dart' as sl;
import 'features/location/presentation/cubit/location_cubit.dart';
import 'features/notification_remain_time/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().init();

  unawaited(sl.init());

  await Firebase.initializeApp();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );

  // Directory appDocDir = await getApplicationDocumentsDirectory();
  // File downloadToFile = File('${appDocDir.path}/SHAJRA SHAREEF HINDI.pdf');
  // print(downloadToFile);
  // try {
  //   await FirebaseStorage.instance
  //       .ref('sujra_sharif/akhtar_raza_khan/SHAJRA SHAREEF HINDI.pdf')
  //       .writeToFile(downloadToFile)
  //       .whenComplete(() => print('sfkladskfjkajsdflkajdsfjsadjf'));
  // } on FirebaseException catch (e) {
  //    e.g, e.code == 'canceled'
  //   print(e);
  // }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late LocationCubit locationCubit;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.sl<LocationCubit>(),
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
                  title: 'Jamat Raza-e-Mustafa',
                  theme: state.currentTheme,
                  debugShowCheckedModeBanner: false,
                  initialRoute: RouteGenerator.bottomTab,
                  onGenerateRoute: RouteGenerator.generateRoute,
                );
              })),
    );
  }
}
