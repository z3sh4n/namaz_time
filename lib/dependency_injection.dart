import 'package:get_it/get_it.dart';

import 'package:sdfsdf/features/sujra_sharif/data/datasource/sujra_firebase_datasouce.dart';
import 'package:sdfsdf/features/sujra_sharif/data/repository_impl/sujra_fb_repository_impl.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/repository/sujra_fb_repository.dart';
import 'package:sdfsdf/features/sujra_sharif/domain/usecase/get_sujra_fb_usecase.dart';

import 'features/location/data/datasource/location_datasource.dart';
import 'features/location/data/repository/location_repository_impl.dart';
import 'features/location/domain/repositories/location_repository.dart';
import 'features/location/domain/usecase/get_location_usecase.dart';
import 'features/location/presentation/location_cubit.dart';
import 'features/location/location_detail_cubit/locationdetail_cubit.dart';
import 'features/namaz_time/data/datasources/namaz_remote_datasource.dart';
import 'features/namaz_time/data/repositories/namaz_time_repository_impl.dart';
import 'features/namaz_time/domain/repositories/namaz_time_repository.dart';
import 'features/namaz_time/domain/usecases/get_namaz_time_list_usecase.dart';
import 'features/namaz_time/presentation/cubit/namaz_time_cubit.dart';
import 'features/sujra_sharif/data/datasource/sujra_datasource.dart';
import 'features/sujra_sharif/data/repository_impl/sujra_repository_impl.dart';
import 'features/sujra_sharif/domain/repository/sujra_repository.dart';
import 'features/sujra_sharif/domain/usecase/get_sujra_sharif_usecase.dart';
import 'features/sujra_sharif/presentation/cubit/cubit/sujrafb_cubit.dart';
import 'features/sujra_sharif/presentation/cubit/sujrasharif_cubit.dart';

final sl = GetIt.I;

Future<void> init() async {
  // bloc/cubit
  sl.registerFactory<LocationCubit>(() => LocationCubit(sl(), sl()));

  sl.registerFactory<NamazTimeCubit>(() => NamazTimeCubit(sl()));

  sl.registerFactory<SujraSharifCubit>(() => SujraSharifCubit(sl()));

  sl.registerFactory<SujraFBCubit>(() => SujraFBCubit(sl()));

  sl.registerSingleton<LocationdetailCubit>(LocationdetailCubit());

 

  // usecase
  sl.registerFactory<GetLocation>(() => GetLocation(locationRepository: sl()));

  sl.registerLazySingleton<GetSujraFB>(() => GetSujraFB(sl()));

  sl.registerLazySingleton<GetSujraSharifList>(() => GetSujraSharifList(sl()));

  sl.registerLazySingleton<GetNamazTimeList>(() => GetNamazTimeList(sl()));

  // repository
  sl.registerLazySingleton<SujraRepository>(() => SujraRepositoryImpl(sl()));

  sl.registerLazySingleton<SujraFireBaseRepo>(
      () => SujraFireBaseRepoImpl(sl()));

  sl.registerLazySingleton<NamazTimeRepository>(
      () => NamazTimeRepositoryImpl(sl()));

  sl.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(sl()));

  // external

  sl.registerLazySingleton<SujraDataSource>(() => SujraDataSourceImpl());

  sl.registerLazySingleton<SujraFirebaseDatasource>(
      () => SujraFirebaseDatasourceImpl());

  sl.registerLazySingleton<NamazRemoteDataSource>(
      () => NamazRemoteDataSourceImpl());

  sl.registerLazySingleton<LocationDataSource>(() => LocationDataSourceImpl());
}
