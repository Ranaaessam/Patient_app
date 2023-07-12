import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idental_n_patient/shared/notification_helper.dart';
import 'package:idental_n_patient/success.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import 'booking_datetime_converted.dart';
import '../../button.dart';

class BookingPage extends StatelessWidget {
  final String? dintestname;
  final String? dintestemail;
  final String? deviceToken;
  const BookingPage({this.dintestname, this.dintestemail, this.deviceToken});
  @override
  Widget build(BuildContext context) {
    // declaration
    List<int> time = [08, 08, 09, 09, 10, 10, 11, 11];

    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            Widget _tableCalendar() {
              return TableCalendar(
                focusedDay: AppCubit.get(context).focusDay,
                firstDay: DateTime.now(),
                lastDay: DateTime(2023, 12, 31),
                calendarFormat: AppCubit.get(context).format,
                currentDay: AppCubit.get(context).currentDay,
                rowHeight: 48,
                calendarStyle: const CalendarStyle(
                  todayDecoration:
                      BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                ),
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                onFormatChanged: (format) {
                  AppCubit.get(context).Change_format(format);
                },
                onDaySelected: ((selectedDay, focusedDay) {
                  AppCubit.get(context).Select_day(selectedDay, focusedDay);
                }),
              );
            }

            return Scaffold(
              appBar: AppBar(
                leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 1,
              ),
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        _tableCalendar(),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          child: Center(
                            child: Text(
                              'Select Consultation Time',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  AppCubit.get(context).isWeekend
                      ? SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            alignment: Alignment.center,
                            child: const Text(
                              'Weekend is not available, please select another date',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      : SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  AppCubit.get(context).changeIndex(index);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          AppCubit.get(context).currentIndex ==
                                                  index
                                              ? Colors.grey
                                              : Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppCubit.get(context).currentIndex ==
                                            index
                                        ? Colors.teal
                                        : Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${time[index]}:${index % 2 == 0 ? "00" : "30"} PM',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          AppCubit.get(context).currentIndex ==
                                                  index
                                              ? Colors.white
                                              : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: 8,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, childAspectRatio: 1.5),
                        ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 80),
                      child: Button(
                        width: double.infinity,
                        title: 'Make Appointment',
                        colors_one: [Colors.grey, Colors.grey],
                        colors_two: [Colors.teal, Color(0xFF80CBC4)],
                        onPressed: () async {
                          //convert date/day/time into string first
                          final getDate = DateConverted.getDate(
                              AppCubit.get(context).currentDay);
                          final getDay = DateConverted.getDay(
                              AppCubit.get(context).currentDay.weekday);
                          final getTime = DateConverted.getTime(
                              AppCubit.get(context).currentIndex!);

                          AppCubit.get(context).AppointmentCreate(
                            dentistname: dintestname,
                            dentistemail: dintestemail,
                            date: getDate,
                            time: getTime,
                            day: getDay,
                          );

                          NotificationHelper.sendPushMessage(
                              token: deviceToken!,
                              body:
                                  '${FirebaseAuth.instance.currentUser?.email}' +
                                      " has booked  an appointment on " +
                                      '${getDate}',
                              title: 'New Appointment');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Success(),
                            ),
                          );
                          // }
                        },
                        // disable: _timeSelected && _dateSelected ? false : true,
                        disable: AppCubit.get(context).timeSelected &&
                                AppCubit.get(context).dateSelected
                            ? false
                            : true,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
