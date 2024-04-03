import 'package:get_it/get_it.dart';
import 'package:wallies/src/core/utils/services/navigation_service.dart';
import 'package:wallies/src/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:wallies/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:wallies/src/features/index/presentation/bloc/index_bloc.dart';
import 'package:wallies/src/features/my_wallies/presentation/bloc/my_wallies_bloc.dart';
import 'package:wallies/src/features/random/presentation/bloc/random_bloc.dart';
import 'package:wallies/src/features/splash/presentation/bloc/splash_bloc.dart';

final sl = GetIt.instance;

initAppInjections() {
  // navigation service
  sl.registerLazySingleton<NavigationService>(() => NavigationService());

  // Bloc & Cubits
  sl.registerFactory<SplashBloc>(() => SplashBloc());
  sl.registerFactory<IndexBloc>(() => IndexBloc());
  sl.registerFactory<HomeBloc>(() => HomeBloc());
  sl.registerFactory<CategoriesBloc>(() => CategoriesBloc());
  sl.registerFactory<RandomBloc>(() => RandomBloc());
  sl.registerFactory<MyWalliesBloc>(() => MyWalliesBloc());
}
