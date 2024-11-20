import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Bloc/ecommeurse_bloc.dart';
import 'package:untitled4/Bloc/ecommeurse_bloc.dart';
import 'package:untitled4/Bloc/signin_bloc.dart';
import 'package:untitled4/Repository/model%20class/EcommeurseModelclass.dart';
import 'package:untitled4/Repository/model%20class/SigninmodelClass.dart';
import 'package:untitled4/UI/Home.dart';
import 'package:untitled4/UI/Signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController Email = TextEditingController();
  TextEditingController password = TextEditingController();
  late SigninmodelClass data;

  @override
  void initState() {
    visible = true;
    super.initState();
  }

  bool visible = false;

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
              height: 697.h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 260, bottom: 20),
                    child: Text(
                      'Sign In Page',
                      style: GoogleFonts.lato(
                        color: Color(0xFF333333),
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text(
                      'User name or email address',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF3C4242),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextField(controller: Email,
                      obscureText: !visible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
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
                          width: 280,
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
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextField(controller:password ,
                      obscureText: visible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 240),
                    child: Text(
                      'Forget your password',
                      style: GoogleFonts.montserrat(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF3C4242),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260),
                    child: BlocListener<SigninBloc, SigninState>(
                      listener: (context, state) {
                        if (state is SigninBlocLoading) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                        }
                        if (state is SigninBlocError) {
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
                        if (state is SigninBlocLoaded) {
                          data = BlocProvider.of<SigninBloc>(context)
                              .signinmodelClass;
                          token(
                              // Signin.token!.access.toString(),
                            data.token!.toString());
                        // login.token!.refresh.toString());

                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Home()));
                        }},child:
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<SigninBloc>(context).add(
                             FetchSignin(email: Email.text.toString(), password:password.text.toString())
                            );
                          },
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
                                'Sign In',
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
                    padding: const EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        Text(
                          'Don’t have an account? ',
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
                            'Sign up ',
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

  void token(
    String token,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Token', token);
  }
}
