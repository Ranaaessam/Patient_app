import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idental_n_patient/modules/signup/cubit/states.dart';
import 'package:rxdart/rxdart.dart';
import '../../../models/patient.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitalState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void PatientRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(RegisterSucessState());
      PatientCreate(
        uId: value.user!.uid,
        name: name,
        email: email,
        phone: phone,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void PatientCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    PatientModel model = PatientModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection('Patients')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreatePatientSucessState());
    }).catchError((error) {
      emit(CreatePatientErrorState(error.toString()));
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

  bool checkBoxValue = false;
  void ChangeCheckBox() {
    if (checkBoxValue == true) {
      checkBoxValue = false;
    } else {
      checkBoxValue = true;
    }
    emit(ChangeCheckBoxState());
  }

  var _phoneNumberController = BehaviorSubject<String>();
  Stream<String> get phoneNumberStream => _phoneNumberController.stream;

  updatePhone(String text) {
    if (text.length != 11) {
      _phoneNumberController.sink
          .addError("Please enter a valid phone number here");
    } else if (!RegExp(r'^(:01[0125])[0-9]{10}$').hasMatch(text)) {
      _phoneNumberController.sink
          .addError("Please enter a valid phone number here");
    } else {
      _phoneNumberController.sink.add(text);
    }
  }

  var _emailController = BehaviorSubject<String>();
  Stream<String> get emailStream => _emailController.stream;

  updateEmail(String text) {
    if (text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(text)) {
      _emailController.sink.addError('Please enter valid email');
    } else {
      _emailController.sink.add(text);
    }
  }

  void onNext() {
    print("Phone number = " + _phoneNumberController.value.toString());
  }
}
