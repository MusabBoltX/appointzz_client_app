import 'package:flutter/cupertino.dart';
import 'package:appointzz_1/Services/ColorPicker.dart';
import 'package:appointzz_1/Views/Home/DoctorBookings/PatientDetails/PatientDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key key}) : super(key: key);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

  double ratingScore = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 8,
          backgroundColor: Color.fromRGBO(7, 78, 99, 0.8),

          leading: IconButton(
              icon: Icon(
                Icons.navigate_before_rounded,
                size: 35,),
              onPressed: (){
                Navigator.of(context).pop();

              }),

          title: Image.asset('assests/logo.png',
            color: Color.fromRGBO(231, 232, 225, 1),
            // color: Colors.black,
            scale: 4.3,
          )),

      body: Container(
        child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              // height: MediaQuery.of(context).size.height *1,

              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'images/noimagefound.jpg',
                          placeholderScale: 1,
                          image: "asset/Images/doctor.png",
                        )),
                  ),

                  Container(
                    child: Column(
                      children: [
                        Text(
                          "\nDr. Stuart",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                        Text(
                          '\nGeneral Physician\n',
                          textScaleFactor: 1.0,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  /// ----- Doctor Details ------ ///
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Row(
                            children: [
                              Container(child: Text('Degree :  ',
                                textScaleFactor: 1.0,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.7,
                                  child: Text(
                                    "MBBS",
                                    textScaleFactor: 1.0,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),///--Degree

                        Container(
                          height: 30,
                          // color: Colors.pinkAccent,
                          child: Row(
                            children: [
                              Container(
                                  child: Text('Consultancy Charges :  ',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                  child: Text("800 Rs")),
                            ],
                          ),
                        ),///--Consultancy Price

                        Container(
                          // color: Colors.brown,
                          height: 17,
                          child: Row(
                            children: [
                              Container(child: Text('Ratings :  ',
                                textScaleFactor: 1.0,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                              Container(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    StarRating(
                                      spaceBetween: 1.2,
                                      starConfig: StarConfig(
                                          size: 20,
                                          strokeWidth: 0,
                                          fillColor: cleanDarkBlueGrey),
                                      rating: double.parse(ratingScore.toString()),
                                      // rating: double.parse(widget.ratingScore),
                                    ),
                                  ],
                                ),
                              ),///--Stars
                            ],
                          ),
                        ),

                        Container(
                          // color: Colors.cyan,
                          height: 30,
                          child: Row(
                            children: [
                              Container(child: Text('Availability Status: ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                                textScaleFactor: 1.0,
                              )),
                              Container(
                                  child: Text(
                                    "Online",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                        ),///--availability
                      ],
                    ),
                  ),

                  /// ----- Doctors availability ----- ///
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Doctor Availability',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          fontSize: 20),
                    ),
                  ),

                  /// ------- Doctor Timings -------- ///
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.grey.shade400,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView.builder(
                                itemCount: _day.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    // color: Colors.yellow,
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            '${_day[index]} :  ',
                                            textScaleFactor: 1.0,
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '02:00 PM - ',
                                            textScaleFactor: 1.0,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '08:00 PM ',
                                            textScaleFactor: 1.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),///--Time Slots
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ))),

      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => PatientDetailsBody()));
            },
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(7, 78, 99, 0.7),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Text(
                'Book Appointment',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }

  List<String> _day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  // List<String> _startTime = [];
  // List<String> _endTime = [];
}
