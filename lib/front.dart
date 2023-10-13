import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Front extends StatelessWidget {
  final String ipAddress;
  

  const Front({super.key, required this.ipAddress}); 
 
  

  // Function to send the GET request
  Future<void> sendGetRequest(String url) async {
    final response = await http.get(Uri.http(ipAddress, url));
    if (response.statusCode == 200) {
      // Request was successful
      print('GET request sent successfully.');
    } else {
      // Request failed
      print('Failed to send GET request.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(124, 147, 168, 1),
        body: Column(
          children: [
            Container(
              height: 19.h,
            ),
            Container(
              width: double.infinity,
              height: 514.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/dophinotech_logo.png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 267.h,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 16.h)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(57.0.sp),
                    ),
                    height: 227.h,
                    width: 290.w,
                    child: Column(
                      children: [
                        Container(
                          height: 31.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(47, 224, 65, 1),
                            borderRadius: BorderRadius.circular(57.0.sp),
                          ),
                          height: 60.h,
                          width: 156.w,
                          child: GestureDetector(
                            onTap: () {
                              // When "TURN ON" button is pressed, send the GET request.
                              sendGetRequest("/on");
                              
                            },
                            child: Center(
                              child: Text(
                                "TURN ON",
                                style: TextStyle(
                                  fontSize: 24.0.sp,
                                  fontFamily: 'MontserratAlternates',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 44.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 49, 61, 1),
                            borderRadius: BorderRadius.circular(57.0.sp),
                          ),
                          height: 60.h,
                          width: 156.w,
                          child: GestureDetector(
                            onTap: () {
                              // When "TURN ON" button is pressed, send the GET request.
                              sendGetRequest("/off");
                            },
                            child: Center(
                              child: Text(
                                "TURN OFF",
                                style: TextStyle(
                                  fontSize: 24.0.sp,
                                  fontFamily: 'MontserratAlternates',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
