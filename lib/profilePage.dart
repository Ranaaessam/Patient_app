import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idental_n_patient/shared/components/components.dart';
import 'package:idental_n_patient/shared/cubit/cubit.dart';
import 'package:idental_n_patient/shared/cubit/states.dart';
import 'getting_started_screen.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool showPassword = false;
    bool edit = true;
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getUserData(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            Size size = MediaQuery.of(context).size;
            if (state is GetPatientDataSuccessState) {
              var model = state.patient;
              nameController.text = model.name!;
              phoneController.text = model.phone!;

              return Scaffold(
                body: Container(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  "Profile",
                                  style: GoogleFonts.montserrat(fontSize: 25),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                  child: Text("Edit",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color: Colors.teal,
                                      )),
                                  onPressed: () {
                                    AppCubit.get(context).uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                    );
                                  }),
                            )
                          ]),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 130,
                              height: 130,
                              child: CircleAvatar(
                                  radius: 64.0,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: state.patient.profileimage!
                                          .startsWith('https')
                                      ? Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 4,
                                                  color: Color(0xFD4D4D5FA)),
                                              boxShadow: [
                                                BoxShadow(
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    offset: Offset(0, 10))
                                              ],
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    state.patient.profileimage!,
                                                  ))),
                                        )
                                      : Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 4,
                                                  color: Color(0xFD4D4D5FA)),
                                              boxShadow: [
                                                BoxShadow(
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    offset: Offset(0, 10))
                                              ],
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(File(state
                                                      .patient
                                                      .profileimage!)))),
                                        )),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.teal,
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.camera_alt_rounded),
                                    color: Colors.white,
                                    onPressed: () {
                                      AppCubit.get(context).getProfileImage();
                                    },
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        label: 'NAME',
                        prefix: Icons.person,
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: 'PHONE',
                        prefix: Icons.phone_android,
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      defaultButton(size.width, 50.0, "Logout", false, () {
                        AppCubit.get(context).logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GettingStartedScreen(),
                          ),
                        );
                        print(nameController.text);
                      })
                    ],
                  ),
                ),
              );
            } else if (state is GetPatientDataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetPatientDataErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is UpdatePatientDataErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
