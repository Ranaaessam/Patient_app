import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idental_n_patient/modules/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitalState());

  static LoginCubit get(context) => BlocProvider.of(context);
  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadinglState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErorrState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = (isPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined);

    emit(ChangePasswordVisibilityState());
  }
}
