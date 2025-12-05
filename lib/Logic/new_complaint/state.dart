class NewComplaintState {}

class NewComplaintInitialState extends NewComplaintState {}

class NewComplaintLoadingState extends NewComplaintState {}

class NewComplaintSuccessState extends NewComplaintState {}

class NewComplaintErrorState extends NewComplaintState {
  final String error;
  NewComplaintErrorState(this.error);
}
