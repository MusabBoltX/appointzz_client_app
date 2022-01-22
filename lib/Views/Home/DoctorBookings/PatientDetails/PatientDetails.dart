import 'dart:ui';
import 'package:appointzz_1/Services/ColorPicker.dart';
import 'package:appointzz_1/Views/Home/DoctorBookings/Booking%20Details/BookingDetails.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'dart:convert';
import 'package:toggle_switch/toggle_switch.dart';

class PatientDetailsBody extends StatefulWidget {
  /// --- Third Receiver --- ///
  final String id;
  final String doctorSpeciality;
  final String experience;
  final String degree;
  final String doctorImage;
  final String doctorId;
  final String doctorName;
  final String doctorNameLast;
  final String doctorFees;

  PatientDetailsBody({
    Key key,
    this.doctorFees,
    this.id,
    this.doctorImage,
    this.degree,
    this.experience,
    this.doctorId,
    this.doctorName,
    this.doctorNameLast,
    this.doctorSpeciality,
  });

  @override
  _PatientDetailsBodyState createState() => _PatientDetailsBodyState();
}

class _PatientDetailsBodyState extends State<PatientDetailsBody> {
  bool _invincible = true;

  @override
  void initState() {
    super.initState();
  }

  /// ========= Radio Value Function ========== ///

  int _radioValue;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  /// ========= Image Picker Function 1 ========= ///

  var photoBase64;

  final picker = ImagePicker();

  List<String> images = [];

  File imageResized;
  File imageResized1;

  /// ========= Image Picker Function 0 ========= ///

  Future getImage(ImageSource source) async {
    final photo = await picker.pickImage(source: ImageSource.gallery);

    imageResized = await FlutterNativeImage.compressImage(photo.path,
        quality: 100, targetWidth: 100, targetHeight: 100);

    setState(() {
      List<int> imageBytes = imageResized.readAsBytesSync();
      photoBase64 = base64Encode(imageBytes);
      debugPrint('$photoBase64');
      images.add(photoBase64);
    });
  }

  /// ========= Image Picker Function 1 ========= ///

  Future getImage1(ImageSource source) async {
    print('image 1');

    final photo = await picker.pickImage(source: ImageSource.gallery);

    imageResized1 = await FlutterNativeImage.compressImage(photo.path,
        quality: 100, targetWidth: 100, targetHeight: 100);

    setState(() {
      List<int> imageBytes = imageResized1.readAsBytesSync();
      photoBase64 = base64Encode(imageBytes);
      debugPrint('$photoBase64');
      images.add(photoBase64);
    });
  }

  /// ========= Controllers ========= ///
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final prevDoctorController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.navigate_before_rounded,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: cleanDarkBlueGrey,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: cleanWhite,
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            children: [
              Container(
                  child: Column(
                children: [
                  Text(
                    '\nWrite Details regarding your symptoms or any previous reports or medicines\n',
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, letterSpacing: 0.7),
                  ),
                ],
              )),

              Container(
                padding: EdgeInsets.only(bottom: 3),
                child: Row(
                  children: [
                    Text('    Full Name*',
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 45,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      color: cleanWhite,
                      child: TextField(
                        maxLines: 1,
                        cursorColor: cleanDarkBlueGrey,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        controller: nameController,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 7)),
                      )),
                ),
              ),

              /// --- Full Name

              Container(
                  child: Row(
                children: [
                  Text(
                    '\n    Gender*',
                    textScaleFactor: 1.0,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              )),

              Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///----------------------Button 1
                    new Radio(
                      activeColor: cleanDarkBlueGrey,
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Male',
                      textScaleFactor: 1.0,
                      style: new TextStyle(fontSize: 16.0),
                    ),

                    ///----------------------Button 2
                    new Radio(
                      activeColor: cleanDarkBlueGrey,
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Female',
                      textScaleFactor: 1.0,
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    ///----------------------Button 3
                    new Radio(
                      activeColor: cleanDarkBlueGrey,
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text('Other',
                        textScaleFactor: 1.0,
                        style: new TextStyle(
                          fontSize: 16.0,
                        )),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      Text(
                        '\n    Age*',
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 45,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(right: 10, left: 10),
                      elevation: 2,
                      color: cleanWhite,
                      child: TextField(
                        maxLines: 1,
                        cursorColor: cleanDarkBlueGrey,
                        maxLength: 3,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        controller: ageController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 7)),
                      )),
                ),
              ),

              Container(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\n    Previous Doctor',
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\nOptional ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 45,
                  child: Card(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      color: cleanWhite,
                      child: TextField(
                        maxLines: 1,
                        cursorColor: cleanDarkBlueGrey,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        controller: prevDoctorController,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 7)),
                      )),
                ),
              ),

              Visibility(
                visible: _invincible,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '\nDo not forget to select Appointment Type!\n',
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red.shade800,
                        fontSize: 15,
                        letterSpacing: 0.7),
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      Text(
                        '    Appointment Type*',
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),

              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 15.0,
                  activeBgColor: [cleanDarkBlueGrey],
                  activeFgColor: cleanWhite,
                  inactiveBgColor: cleanGrey,
                  inactiveFgColor: cleanWhite,
                  totalSwitches: 2,
                  labels: ['Online', 'Hospital'],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),

              Container(
                  child: Wrap(
                children: [
                  Text(
                    '\n    Previous Reports/ Medicine',
                    textScaleFactor: 1.0,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '\nOptional ',
                    textScaleFactor: 1.0,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              )),

              Container(
                padding: EdgeInsets.only(top: 25, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 100,
                        height: 75,
                        child: imageResized == null
                            ? Card(
                                child: Icon(
                                  Icons.image,
                                  color: cleanDarkBlueGrey,
                                ),
                              )
                            : Image.file(imageResized),
                      ),
                      onTap: () {
                        getImage(ImageSource.gallery);
                      },
                    ),
                    GestureDetector(
                        child: Container(
                          width: 100,
                          height: 75,
                          child: imageResized1 == null
                              ? Card(
                                  child: Icon(
                                    Icons.image,
                                    color: cleanDarkBlueGrey,
                                  ),
                                )
                              : Image.file(imageResized1),
                        ),
                        onTap: () {
                          getImage1(ImageSource.gallery);
                        }),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      Text(
                        '\n    Description*',
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),

              Theme(
                data: ThemeData(primaryColor: Colors.transparent),
                child: Container(
                  height: 45,
                  child: Card(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      color: cleanWhite,
                      child: TextField(
                        maxLines: 1,
                        cursorColor: cleanDarkBlueGrey,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        controller: descriptionController,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 7)),
                      )),
                ),
              ),

              Container(height: 25),

              // Container(
              //   width: 190,
              //   height: 40,
              //   child: RaisedButton(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15)),
              //     color: dark,
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           CupertinoPageRoute(
              //               builder: (context) => BookingDetails()));
              //     },
              //     child: Text(
              //       'N E X T',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),

              Container(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => BookingDetails()));
            },
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: cleanDarkBlueGrey,
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
                  color: cleanWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
