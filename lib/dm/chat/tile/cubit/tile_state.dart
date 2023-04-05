part of 'tile_cubit.dart';

@immutable
abstract class TileState {}

class TileInitial extends TileState {}

class UserLoading extends TileState {}

class UserLoaded extends TileState {
  final String user;

  UserLoaded({required this.user});
}