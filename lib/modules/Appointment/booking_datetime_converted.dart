import 'package:intl/intl.dart';

//this basically is to convert date/day/time from calendar to string
class DateConverted {
  static String getDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  static String getDay(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Sunday';
    }
  }

  static String getTime(int time) {
    switch (time) {
      case 0:
        return '08:00 PM';
      case 1:
        return '08:30 PM';
      case 2:
        return '09:00 PM';
      case 3:
        return '09:30 PM';
      case 4:
        return '10:00 PM';
      case 5:
        return '10:30 PM';
      case 6:
        return '11:00 PM';
      case 7:
        return '11:30 PM';
      default:
        return '9:00 AM';
    }
  }
}
