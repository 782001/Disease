import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diseases/auth/register/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/components.dart';
import '../../../models/login_model.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  // void userRegister({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String password,
  // }) {
  //   emit(RegisterLoadingState());
  //   // DioHelper.Postdata(
  //   //   url: REGISTER,
  //   //   data: {
  //   //     'name': name,
  //   //     'email': email,
  //   //     'phone': phone,
  //   //     'password': password,
  //   //   },
  //   // ).then((value) {
  //   //   print(value.data);
  //   //   loginModel = LoginModel.FromJson(value.data);
  //   //   emit(RegisterSuccessState(loginModel!));
  //   // }).catchError((error){
  //   //   emit(RegisterErrorState(error.toString()));
  //   //   print(error.toString());
  //   // });
  // }
  String? errorMessage;
  Future<RegisterScreen> userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('email:>${value.user!.email}');
        print('uid:>${value.user!.uid}');
        // emit(RegisterSuccessState());

        userCreate(
          email: value.user?.email,
          password: password,
          name: name,
          phone: phone,
          uId: value.user!.uid,
          isEmailVerified: true,
        );
      });
      //     .catchError((error) {
      //   emit(RegisterErrorState(error.toString()));
      //   print('erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      // });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "يبدو أن عنوان بريدك الإلكتروني غير صحيح.";
          break;
        case "wrong-password":
          errorMessage = "كلمة المرور الخاصة بك خاطئة.";
          break;
        case "user-not-found":
          errorMessage = "مستخدم بهذا البريد الإلكتروني غير موجود.";
          break;
        case "email-already-in-use":
          errorMessage =
              "عنوان البريد الإلكتروني قيد الاستخدام بالفعل من قبل حساب آخر";
          break;
        case "user-disabled":
          errorMessage = "تم تعطيل المستخدم مع هذا البريد الإلكتروني.";
          break;
        case "too-many-requests":
          errorMessage = "برجاء المحاوله لاحقأ";
          break;
        case "operation-not-allowed":
          errorMessage = "لا يمكن تسجيل الدخول بالبريد الكتروني وكلمة المرور ";
          break;
        default:
          errorMessage = "حدث خطأ غير معروف";
      }
      emit(RegisterErrorState(error.toString()));
      ShowToust(Text: errorMessage!, state: ToustStates.ERROR);
    }
    // on PlatformException catch (error) {
    //   switch (error.code) {
    //     case "invalid-email":
    //       errorMessage = "Your email address appears to be incorrect.";
    //       break;
    //     case "wrong-password":
    //       errorMessage = "Your password is wrong.";
    //       break;
    //     case "user-not-found":
    //       errorMessage = "User with this email doesn't exist.";
    //       break;
    //     case "email-already-in-use":
    //       errorMessage =
    //           "The email address is already in use by another account";
    //       break;
    //     case "user-disabled":
    //       errorMessage = "User with this email has been disabled.";
    //       break;
    //     case "too-many-requests":
    //       errorMessage = "Too many requests";
    //       break;
    //     case "operation-not-allowed":
    //       errorMessage = "Signing in with Email and Password is not enabled.";
    //       break;
    //     default:
    //       errorMessage = "An undefined Error happened.";
    //   }
    // }
    return RegisterScreen();
  }

  void userCreate({
    required String? email,
    required String? password,
    required String? name,
    required String? phone,
    required String? uId,
    required bool? isEmailVerified,
  }) async {
    authUserModel model = authUserModel(
      name: name,
      phone: phone,
      email: email,
      password: password,
      uId: uId,
      isEmailVerified: isEmailVerified,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      print(
          'createddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd');

      emit(CreateUserSuccessState());
    }).catchError((error) {
      print('erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(CreateUserErrorState(error.toString()));
    });
  }

  Icon suffix = Icon(Icons.remove_red_eye);
  bool isPasswordShow = true;

  void ChangeRegisterPaswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icon(Icons.remove_red_eye)
        : Icon(Icons.visibility_off);
    emit(RegisterChangePasswordVisibilityState());
  }

  bool emailValid = false;
  bool legalEmail(String email) {
    return emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop/all_register_screen/register_cubit/register_states.dart';
//
// import '../../end_points/end_point.dart';
// import '../../models/login_model.dart';
// import '../../network/remote/dio_helper.dart';
//
//
// class RegisterCubit extends Cubit<RegisterStates>{
//   RegisterCubit() : super(RegisterInitialState());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//
//   LoginModel? loginModel;
//
//   void userRegister({
//     required String name,
//     required String email,
//     required String password,
//     required String phone,
//   }){
//     emit(RegisterLoadingState());
//     DioHelper.Postdata(
//       url: REGISTER,
//       data: {
//         'name': name,
//         'email': email,
//         'password': password,
//         'phone': phone,
//       },
//     ).then((value) {
//       print(value.data);
//       loginModel = LoginModel.FromJson(value.data);
//       emit(RegisterSuccessState(loginModel!));
//     }).catchError((error){
//       emit(RegisterErrorState(error.toString()));
//     });
//   }
//
//   IconData suffix = Icons.visibility;
//   bool isPassword = false;
//   void changePasswordVisibility(){
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility : Icons.visibility_off;
//     emit(RegisterChangePasswordVisibilityState());
//   }
//
//
//   IconData confirmSuffix = Icons.visibility;
//   bool isConfirmPassword = false;
//   void changeConfirmPasswordVisibility(){
//     isConfirmPassword = !isConfirmPassword;
//     confirmSuffix = isConfirmPassword ? Icons.visibility : Icons.visibility_off;
//     emit(RegisterChangePasswordVisibilityState());
//   }
//
//
//
//   bool emailValid= false;
//   bool legalEmail(String email){
//     return emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
//   }
// }
