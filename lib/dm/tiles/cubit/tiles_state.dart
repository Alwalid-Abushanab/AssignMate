part of 'tiles_cubit.dart';

@immutable
abstract class TilesState {}

class TilesInitial extends TilesState {}

class TileLoading extends TilesState{}

class TileLoaded extends TilesState{
  final Stream? snapshot;
  final String currUsername;
  final String picUrl;

  TileLoaded({required this.snapshot, required this.currUsername, required this.picUrl});
}