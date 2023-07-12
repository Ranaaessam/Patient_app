import 'package:idental_n_patient/layout/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:idental_n_patient/shared/components/components.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 4,
            ),
            Image(
              image: AssetImage('assets/images/neww_success.gif'),
              height: 100.0,
            ),
            SizedBox(
              height: size.height / 5,
            ),
            Text(
              'Successfully Booked',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 5),
            defaultButton(size.width, 50.0, 'Back to Home Page', 2, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            }, color1: Color(0XFF55ACAC), color2: Color(0xFF6FE0E0))
          ],
        ),
      ),
    );
  }
}
