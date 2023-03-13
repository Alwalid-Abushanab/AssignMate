import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'assignments_state.dart';

class AssignmentsCubit extends Cubit<AssignmentsState> {
  AssignmentsCubit() : super(const currentAssignments());

  void change(){
    if(state is currentAssignments){
      emit(const pastAssignments());
    }
    else {
      emit(const currentAssignments());
    }
  }
}
