import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/Bloc/ecommeurse_bloc.dart';
import 'package:untitled4/Repository/model%20class/EcommeurseModelclass.dart';
import 'package:untitled4/UI/Home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController Email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();


  late EcommeurseModelclass data;


  @override
  void initState() {
    visible = true;
    super.initState();
  }

  bool visible = false;
  bool? value = false;
  bool? value1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1440.w,
        height: 1067.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              width: 695.w,
              height: 956.h,
              decoration: BoxDecoration(color: Color(0x26111111)),
              child: Image.asset("assets/a.png", fit: BoxFit.cover),
            ),
            Container(
              color: Colors.white,
              width: 568.w,
              height: 910.h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 280,),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.lato(
                        color: Color(0xFF333333),
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      'Sign up for free to access to in any of our products ',
                      style: GoogleFonts.lato(
                        color: Color(0xCC666666),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 270),
                    child: Text(
                      "username",
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF3C4242),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 80, right: 50, top: 10),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            labelText: "Username")),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      'Email Address',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF3C4242),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ), SizedBox(height: 10.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 50),
                    child: TextFormField(

                      controller: Email,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          labelText: " Email"),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        Text(
                          'Password',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF3C4242),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 240,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            child: Icon(visible
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off)),
                        Text(
                          'Hide',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF3C4242),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 50),
                    child: TextField(
                      obscureText: visible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      'Use 8 or more characters with a mix of letters, numbers & symbols',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF807D7E),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          tristate: true, // Example with tristate
                          value: value,
                          onChanged: (bool? newValue) {
                            setState(() {
                              value = !value!;
                            });
                          },
                        ),
                        Text(
                          'Agree to our Terms of use and Privacy Policy ',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF807D7E),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          tristate: true, // Example with tristate
                          value: value1,
                          onChanged: (bool? newValue) {
                            setState(() {
                              value1 = !value1!;
                            });
                          },
                        ),
                        Text(
                          'Subscribe to our monthly newsletter ',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF807D7E),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 210),
                    child: BlocListener<EcommeurseBloc, EcommeurseState>(
                      listener: (context, state) {
                        if (state is EcommeurseBlocLoading) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                        }
                        if (state is EcommeurseBlocError) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: Text(
                                  'Something Wrong',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          );
                        }
                        if (state is EcommeurseBlocLoaded) {
                          data = BlocProvider
                              .of<EcommeurseBloc>(context)
                              .ecommeurseModelclass;


                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Home()));

                      }
                      },
                      child: GestureDetector(onTap:(){BlocProvider.of<EcommeurseBloc>(context).add(FetchEcommeurse(fullname: username.text, email:Email.text, password: password.toString()));},
                        child: Container(
                          width: 167.w,
                          height: 54.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFF8A33FD),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Row(
                      children: [
                        Text(
                          'Already have an  account? ',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF3C4242),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Signup(),
                              ),
                            );
                          },
                          child: Text(
                            'Login ',
                            style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              color: Color(0xFF3C4242),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
