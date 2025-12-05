class SignUpStates {}

class SignUpInitailState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSucessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String errorMessage;
  SignUpErrorState({required this.errorMessage});
}
