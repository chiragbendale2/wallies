import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'my_wallies_event.dart';
part 'my_wallies_state.dart';

class MyWalliesBloc extends Bloc<MyWalliesEvent, MyWalliesState> {
  MyWalliesBloc() : super(MyWalliesInitial()) {
    on<MyWalliesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  ValueNotifier<bool> autoWallChanger = ValueNotifier(false);
}
