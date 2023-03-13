part of 'assignments_cubit.dart';

@immutable
abstract class AssignmentsState {
  const AssignmentsState();
}

class currentAssignments extends AssignmentsState{
  const currentAssignments();
}

class pastAssignments extends AssignmentsState{
  const pastAssignments();
}


