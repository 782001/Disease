import 'package:diseases/core/shared/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  // void UserLogin({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(LoginLodingState());
  //   // DioHelper.Postdata(
  //   //     url: LOGIN,
  //   //     data: {
  //   //       "email":email,
  //   //       "password":password
  //   //     }
  //   // ).then((value) {
  //   //   print(value.data);
  //   //   loginModel= LoginModel.FromJson(value.data);
  //   //   emit(LoginSucssesState(loginModel!));
  //   //     }
  //   //     )
  //   //     .catchError((error){
  //   //    emit(LoginErrorState( error));
  //   //    print(error.message());
  //   // })
  //   // ;
  // }
  String? errorMessage;
  void UserLogin({
    required String email,
    required String password,
  }) async {
    // emit(LoginLodingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('loginnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
        emit(LoginSucssesState(value.user!.uid));
      });
      // .catchError((error) {
      //   emit(LoginErrorState(error.toString()));
      //   ShowToust(Text: error.toString(), state: ToustStates.ERROR);
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
      ShowToust(Text: errorMessage!, state: ToustStates.ERROR);
    }
  }

  Icon suffix = Icon(Icons.remove_red_eye);
  bool isPasswordShow = true;

  void ChangePaswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icon(Icons.remove_red_eye)
        : Icon(Icons.visibility_off);
    emit(LoginChangePaswordVisibilityState());
  }

  bool emailValid = false;
  bool legalEmail(String email) {
    return emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

// void signUp(String email, String password) async {
//     if (GlobalKey<FormState>().currentState!.validate()) {
//       try {
//         await FirebaseAuth.instance //<--- Error stops here
//             .createUserWithEmailAndPassword(email: email, password: password)
//             .then((value) => {postDetailsToFirestore()})
//             .catchError((e) {
//           Fluttertoast.showToast(msg: e!.message);
//         });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be incorrect.";
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }
