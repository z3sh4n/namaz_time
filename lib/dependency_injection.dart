import 'package:get_it/get_it.dart';

import 'package:sdfsdf/features/location/presentation/cubit/locationdetail_cubit.dart';
import 'package:sdfsdf/features/namaz_time/data/datasources/namaz_remote_datasource.dart';
import 'package:sdfsdf/features/namaz_time/presentation/cubit/namaz_time_cubit.dart';
import 'package:sdfsdf/features/qiblah_direction/blocs/angle_bloc/angle_bloc.dart';
import 'package:sdfsdf/features/qiblah_direction/blocs/qibla_bloc/qibla_bloc.dart';
import 'package:sdfsdf/features/sujra_sharif/data/datasource/sujra_datasource.dart';
import 'package:sdfsdf/features/sujra_sharif/data/repository_impl/sujra_repository_impl.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/repository/sujra_repository.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/usecase/get_sujra_sharif_usecase.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/cubit/sujrasharif_cubit.dart';

import 'features/location/data/datasource/location_datasource.dart';
import 'features/location/data/repository/location_repository_impl.dart';
import 'features/location/domain/repositories/location_repository.dart';
import 'features/location/domain/usecase/get_location_usecase.dart';
import 'features/location/presentation/cubit/location_cubit.dart';
import 'features/namaz_time/data/repositories/namaz_time_repository_impl.dart';
import 'features/namaz_time/domain/repositories/namaz_time_repository.dart';
import 'features/namaz_time/domain/usecases/get_namaz_time_list_usecase.dart';

final sl = GetIt.I;

Future<void> init() async {
  // bloc/cubit
  sl.registerFactory<NamazTimeCubit>(() => NamazTimeCubit(sl()));

  sl.registerFactory<SujraSharifCubit>(() => SujraSharifCubit(sl()));

  sl.registerSingleton<LocationdetailCubit>(LocationdetailCubit());

  sl.registerFactory<QiblaBloc>(() => QiblaBloc());

  sl.registerFactory<AngleBloc>(() => AngleBloc(sl()));

  sl.registerFactory<LocationCubit>(() => LocationCubit(sl(), sl()));

  // usecase
  sl.registerLazySingleton<GetSujraSharifList>(() => GetSujraSharifList(sl()));

  sl.registerLazySingleton<GetNamazTimeList>(() => GetNamazTimeList(sl()));

  sl.registerLazySingleton<GetLocation>(
      () => GetLocation(locationRepository: sl()));

  // repository
  sl.registerLazySingleton<SujraRepository>(() => SujraRepositoryImpl(sl()));

  sl.registerLazySingleton<NamazTimeRepository>(
      () => NamazTimeRepositoryImpl(sl()));

  sl.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(sl()));

  // external

  sl.registerLazySingleton<SujraDataSource>(() => SujraDataSourceImpl());

  sl.registerLazySingleton<NamazRemoteDataSource>(
      () => NamazRemoteDataSourceImpl());

  sl.registerLazySingleton<LocationDataSource>(() => LocationDataSourceImpl());
}
