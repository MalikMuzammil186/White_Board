import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_white_bord_with_bloc/bloc/white_bord_state.dart';

part 'bord_events.dart';


class WhiteBordBloc extends Bloc<BoardEvent, WhiteBordState> {
  final strokes =<Path>[];
  WhiteBordBloc()
      : super(IntitalWhiteBordState()) {
    on<LoadedEvent>((event, emit) => 
    emit(LoadedWhiteBordState(strokes: strokes)));
    on<InitialEvent>((event, emit) {});
  }
}