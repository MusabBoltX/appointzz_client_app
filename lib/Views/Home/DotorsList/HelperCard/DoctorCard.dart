import 'package:flutter/cupertino.dart';
import 'package:appointzz_1/Views/Home/DoctorBookings/PatientDetails/PatientDetails.dart';
import 'package:appointzz_1/Views/Home/DoctorDetails/DoctorDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';

class DoctorCard extends StatefulWidget {
  final String title, descriptions;
  final String img;

  const DoctorCard({Key key, this.descriptions, this.img, this.title}) : super(key: key);

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[

        Container(
          padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.black45,offset: Offset(0,1),
                    blurRadius: 5,
                ),
              ]
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                // -- Data Items & Image -- //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                                textScaleFactor: 1.0,
                                style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
                        SizedBox(height: 5),
                        Text(widget.descriptions,
                                textScaleFactor: 1.0,
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center),
                        SizedBox(height: 5),

                        ///--Ratings
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
                                    fillColor: Colors.blueGrey.shade600),
                                rating: 4,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 5),
                      ],
                    ),

                    // -- Avatar -- //
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: Constants.avatarRadius,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                              child: Image.asset("asset/Images/doctor.png", scale: 1),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),

                // -- Buttons -- //
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) => DoctorDetails()));
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: Color.fromRGBO(7, 78, 99, 0.7),
                      child: Text('Details',
                        style: TextStyle(
                          color: Color.fromRGBO(231, 232, 225, 1),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) => PatientDetailsBody()));
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: Color.fromRGBO(7, 78, 99, 0.7),
                      child: Text('Book',
                        style: TextStyle(
                          color: Color.fromRGBO(231, 232, 225, 1),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            )
          ),
        ),

      ],
    );

  }
}


class Constants{
  Constants._();
  static const double padding = 40;
  static const double avatarRadius = 40;
}