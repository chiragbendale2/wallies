import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexInitial()) {
    on<IndexEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  ValueNotifier<bool> isDrawerOpen = ValueNotifier(false);
}
