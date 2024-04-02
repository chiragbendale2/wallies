import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallies/src/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:wallies/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:wallies/src/features/index/presentation/bloc/index_bloc.dart';
import 'package:wallies/src/features/my_wallies/presentation/bloc/my_wallies_bloc.dart';
import 'package:wallies/src/features/random/presentation/bloc/random_bloc.dart';
import 'package:wallies/src/features/splash/presentation/bloc/splash_bloc.dart';

class AppBlocProviders {
  static final blocProviders = [
    BlocProvider<IndexBloc>(
      create: (context) => IndexBloc(),
    ),
    BlocProvider<SplashBloc>(
      create: (context) => SplashBloc(),
    ),
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
    ),
    BlocProvider<CategoriesBloc>(
      create: (context) => CategoriesBloc(),
    ),
    BlocProvider<RandomBloc>(
      create: (context) => RandomBloc(),
    ),
    BlocProvider<MyWalliesBloc>(
      create: (context) => MyWalliesBloc(),
    ),
  ];
}
