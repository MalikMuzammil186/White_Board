
import 'package:flutter/material.dart';

 sealed class WhiteBordState {
  const WhiteBordState();
 }


final class IntitalWhiteBordState extends WhiteBordState {}

final class LoadedWhiteBordState extends WhiteBordState {
  List<Path> strokes;
  LoadedWhiteBordState({required this.strokes});
  
}

