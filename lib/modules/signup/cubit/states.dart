abstract class RegisterStates {}

class RegisterInitalState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSucessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class CreatePatientLoadingState extends RegisterStates {}

class CreatePatientSucessState extends RegisterStates {}

class CreatePatientErrorState extends RegisterStates {
  final String error;

  CreatePatientErrorState(this.error);
}

class ChangePasswordVisibilityState extends RegisterStates {}

class ChangeCheckBoxState extends RegisterStates {}
