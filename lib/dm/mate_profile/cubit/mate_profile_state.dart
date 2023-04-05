part of 'mate_profile_cubit.dart';

@immutable
abstract class MateProfileState {}

class MateProfileInitial extends MateProfileState {}

class MateProfileLoading extends MateProfileState {}

class MateProfileLoaded extends MateProfileState {
  final Map<String, dynamic> data;

  MateProfileLoaded({required this.data});
}