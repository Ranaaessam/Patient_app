import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idental_n_patient/shared/notification_helper.dart';

class PatientModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? uId;
  final String? docid;
  final String? profileimage;
  final String? devicetoken;

  PatientModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.docid,
    this.profileimage,
    this.devicetoken,
  });

  factory PatientModel.fromdoc(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final patient = PatientModel(
      name: doc.data()!['name'],
      email: doc.data()!['email'],
      phone: doc.data()!['phone'],
      uId: doc.data()!['uId'],
      docid: doc.id,
      profileimage: doc.data()!['profileimage'],
      devicetoken: doc.data()!['devicetoken'],
    );
    return patient;
  }

  PatientModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? uId,
    String? docid,
    String? profileimage,
    String? devicetoken,
  }) =>
      PatientModel(
        name: name ?? this.name,
        email: email ?? this.email,
        profileimage: profileimage ?? this.profileimage,
        uId: uId ?? this.uId,
        phone: phone ?? this.phone,
        devicetoken: devicetoken ?? this.devicetoken,
      );

  Map<String, dynamic> toMap() {
    print("Device Token ****************");
    print(NotificationHelper.deviceToken);
    return {
      'name': name,
      'email': email,
      'phone': phone ?? '',
      'uId': uId,
      'docid': docid,
      'profileimage': profileimage ??
          'https://www.gentledental.com/sites/default/files/2020-03/generic-doctor-profile.jpg',
      'devicetoken': NotificationHelper.deviceToken,
    };
  }
}
