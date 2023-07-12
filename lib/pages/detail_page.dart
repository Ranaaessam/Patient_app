import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idental_n_patient/pages/home_page.dart';
import '../modules/Appointment/booking_page.dart';
import '../cells/detail_cell.dart';
import '../shared/components/components.dart';
import '../utils/he_color.dart';

class Detailpage extends StatelessWidget {
  final Map<String, dynamic> dentist;
  const Detailpage({required this.dentist});
  @override
  Widget build(BuildContext context) {
    AppBar _buildAppBar() {
      return AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20),
            onPressed: () {
              navigateAndFinish(context, HomePage());
            }),
      );
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSection(),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr.' + '${dentist['name']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            size: 14,
                            color: Colors.teal,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${dentist['clinicname']}',
                            style: TextStyle(
                              color: HexColor('#C6C6CD'),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.teal,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${dentist['clinicaddress']}',
                            style: TextStyle(
                              color: HexColor('#C6C6CD'),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: HexColor('#FFF9EA'),
                      border: Border.all(color: HexColor('#FFEDBE'), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Dentist',
                      style: TextStyle(
                        color: HexColor('#FFBF11'),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Dr. Eman El-Tokhy a dentist who diagnose and treat problems with patients’ teeth, gums, and related parts of the mouth. They provide advice and instruction on taking care of the teeth and gums and on diet choices that affect oral health. While Dr Ho specializes in dialysis and critical care dental, years of extensive training have also equipped him with skills to effectively handle a wide range of other dental diseases',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 91,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetailCell(
                          title: '162',
                          subTitle: 'Patients',
                        ),
                        DetailCell(title: '4+', subTitle: 'Exp. Years'),
                        DetailCell(title: '4273', subTitle: 'Rating'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Apart from dental-related conditions, Dr Ho also offers care and consultation in various medical conditions that are related to dental disease, such as caries, periodontal and orthodontist diseases.',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  defaultButton(size.width, 50.0, 'Book Appointment', 0, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingPage(
                            dintestname: '${dentist['name']}',
                            deviceToken: '${dentist['devicetoken']}',
                            dintestemail: '${dentist['email']}'),
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _titleSection() {
    return Container(
      height: 250,
      color: Colors.teal,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 207,
              height: 178,
              child: Image(
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bg_shape.png'),
              ),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 15,
            child: SizedBox(
              height: 250,
              child: AspectRatio(
                aspectRatio: 196 / 285,
                child: Hero(
                  tag: dentist['name'],
                  child: DecoratedBox(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: NetworkImage('${dentist['profileimage']}'),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 15,
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 32,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: HexColor('#FFBB23'),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Text(
                    '4.5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
