import 'package:flutter/cupertino.dart';
import 'package:appointzz_1/Services/ColorPicker.dart';
import 'package:appointzz_1/Views/Home/DoctorBookings/Payments&Checkout/Payments&Checkout.dart';
import 'package:flutter/material.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key key}) : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.navigate_before_rounded,
              size: 35,),
            onPressed: (){
              Navigator.of(context).pop();
            }),
        backgroundColor: cleanDarkBlueGrey,
      ),

      body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [

                Container(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/Images/jackpot.png'),
                  ],
                ),

                Container(height: 10),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your Token Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ],
                      ),
                      Text('091', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                    ],
                  ),
                ),

                Container(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width*0.95,
                  padding: EdgeInsets.all(20),
                  child: Card(
                    color: cleanWhite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Row(
                              children: [
                                Text('Doctor Name:', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('  Dr. Stuart', style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Row(
                              children: [
                                Text('Patient Name:', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('  Hammad', style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Row(
                              children: [
                                Text('Patient Age:', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('  24', style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(height: 10),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Amount Payable', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ],
                      ),
                      Text('Rs. 800', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                    ],
                  ),
                ),

                Container(height: 50),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => Payment()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.80,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: cleanWhite,
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 0.5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(29),
                    ),

                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
                      color: Color.fromRGBO(7, 78, 99, 0.6),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Proceed',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: cleanWhite,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
