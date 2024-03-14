part of 'bord_bloc.dart';

@immutable
sealed class BoardEvent {}

@immutable
final class InitialEvent extends BoardEvent {}

@immutable
final class LoadedEvent extends BoardEvent {}