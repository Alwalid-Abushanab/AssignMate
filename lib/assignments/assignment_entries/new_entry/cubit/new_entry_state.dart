part of 'new_entry_cubit.dart';

@immutable
abstract class NewEntryState {}

class NewEntryInitial extends NewEntryState {}

class NewEntryCreating extends NewEntryState {}

class NewEntryCreated extends NewEntryState {}

class DatePicked extends NewEntryState {
  final String title;
  final DateTime dueDate;

  DatePicked({required this.title, required this.dueDate});
}
