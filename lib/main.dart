import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'front.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          title: 'DophinoTech',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(223, 232, 240, 1)),
              useMaterial3: true),
         
          debugShowCheckedModeBanner: false,
         
          home: const FormPage(),
        );
      }
    );
  }


}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Variables to store user input
  String ipAddress = '';

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, save the data to variables
      _formKey.currentState!.save();
      
      // Now you can use 'name' and 'email' variables for further processing
      print('ip Address: $ipAddress');
     
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Front(ipAddress: ipAddress),
        ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(254, 218, 94, 1),
        title: const Text('Enter The IpAddress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'IpAddress'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Ip address of the server';
                  }
                  return null;
                },
                onSaved: (value) {
                  ipAddress = value!;
                },
              ),
             
              const SizedBox(height: 20.0),
               Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(47, 120, 255, 1),
                            borderRadius: BorderRadius.circular(57.0.sp),
                          ),
                          height: 60.h,
                          width: 156.w,
                          child: GestureDetector(
                            onTap: () {
                              // When "TURN ON" button is pressed, send the GET request.
                              _submitForm();
                              
                            },
                            child: Center(
                              child: Text(
                                "Get Started",
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
        ),
      ),
    );
  }
}
