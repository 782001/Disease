// ignore_for_file: depend_on_referenced_packages

import 'package:diseases/presination/controller/app_cubit.dart';
import 'package:diseases/presination/screens/HomeScreen.dart';
import 'package:diseases/presination/screens/bording_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/login/login_cubit/login_cubit.dart';
import 'auth/login/login_screen.dart';
import 'auth/register/register_cubit/register_cubit.dart';
import 'core/network/local/cashhelper.dart';
import 'core/shared/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DioHelper.init();
  await Firebase.initializeApp();

  await CashHelper.init();
  Widget widget;
  bool? onBording = CashHelper.GetBoolData(key: 'onBording');
//   runApp(const MyApp());
//

  uId = (await CashHelper.GetData(key: 'uId'));
  // if(uId != null){
  //   widget=socialLayout();
  // }else
  // {
  //   widget=loginScreen();
  // }

  if (onBording != null) {
    if (uId != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const BordingScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget StartWidget;

  const MyApp(this.StartWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => AppCubit()
              ..GetDownData()
              ..GetWestData()
              ..GetRetData(),
          ),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted
              primarySwatch: Colors.teal,
            ),
            debugShowCheckedModeBanner: false,
            home: StartWidget,
          );
        }));
  }
}
