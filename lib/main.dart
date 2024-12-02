import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled4/Bloc/banner_bloc.dart';
import 'package:untitled4/Bloc/ecommeurse_bloc.dart';
import 'package:untitled4/Bloc/popular_product_bloc.dart';
import 'package:untitled4/Bloc/signin_bloc.dart';
import 'package:untitled4/UI/Signup.dart';
import 'package:untitled4/UI/sign%20in.dart';

import 'UI/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 1067),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => EcommeurseBloc(),
              ),
              BlocProvider(
                create: (context) => SigninBloc(),
              ),
              BlocProvider(
                create: (context) => BannerBloc(),
              ),
              BlocProvider(
                create: (context) => PopularProductBloc(),
              )
            ],
            child: MaterialApp(debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  // This is the theme of your application.
                  //
                  // TRY THIS: Try running your application with "flutter run". You'll see
                  // the application has a purple toolbar. Then, without quitting the app,
                  // try changing the seedColor in the colorScheme below to Colors.green
                  // and then invoke "hot reload" (save your changes or press the "hot
                  // reload" button in a Flutter-supported IDE, or press "r" if you used
                  // the command line to start the app).
                  //
                  // Notice that the counter didn't reset back to zero; the application
                  // state is not lost during the reload. To reset the state, use hot
                  // restart instead.
                  //
                  // This works for code too, not just values: Most code changes can be
                  // tested with just a hot reload.
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: Home()
            ),
          );
        }
    );
  }
}

