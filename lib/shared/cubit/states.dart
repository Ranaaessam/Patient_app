import 'dart:async';
import 'dart:io';

import 'package:idental_n_patient/models/DentistModel.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/patient.dart';

abstract class AppStates {}

class AppInitalState extends AppStates {}

class AppChangeBottomNavBar extends AppStates {}

class GetPatientDataLoadingState extends AppStates {}

class GetPatientDataSuccessState extends AppStates {
  final PatientModel patient;
  GetPatientDataSuccessState({required this.patient});
}

class GetPatientDataErrorState extends AppStates {
  final String error;
  GetPatientDataErrorState(this.error);
}

class GetReportSuccessState extends AppStates {
  List<Map<String, dynamic>> reports;
  GetReportSuccessState(this.reports);
}

class GetReportErrorState extends AppStates {
  final String error;
  GetReportErrorState(this.error);
}

class ProfileImagePickedSuccessState extends AppStates {}

class ProfileImagePickedErrorState extends AppStates {}

// class UploadProfileImageSuccessState extends AppStates {}
// class UploadProfileImageErrorState extends AppStates {}

class UpdatePatientDataLoadingState extends AppStates {}

class UpdatePatientDataSuccessState extends AppStates {
  final PatientModel patient;
  UpdatePatientDataSuccessState({required this.patient});
}

class UpdatePatientDataErrorState extends AppStates {
  final String error;

  UpdatePatientDataErrorState(this.error);
}

class GetDentistDataSuccessState extends AppStates {
  List<Map<String, dynamic>> dentists;
  GetDentistDataSuccessState({required this.dentists});
}

class GetsearchDataSuccessState extends AppStates {
  List<Map<String, dynamic>> dentists;
  GetsearchDataSuccessState({required this.dentists});
}

class GetAppointmentsSuccessState extends AppStates {
  List<Map<String, dynamic>> appointments;
  GetAppointmentsSuccessState({required this.appointments});
}

class ChangeClanderFormatState extends AppStates {
  final CalendarFormat format;
  ChangeClanderFormatState({required this.format});
}

class SelectdayloadingState extends AppStates {}

class SelectdaySuccessState extends AppStates {}

class ChangeIndexState extends AppStates {}

class pickedAppointmentSuccessState extends AppStates {}

class pickedAppointmentLoadingState extends AppStates {}

class pickedAppointmentErrorState extends AppStates {
  final String error;
  pickedAppointmentErrorState(this.error);
}
