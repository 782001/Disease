import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:diseases/core/utils/assets_images_path.dart';
import 'package:diseases/presination/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/network/local/cashhelper.dart';
import '../../core/shared/components.dart';
import '../register/register_screen.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          // if (state is LoginErrorState) {
          //   ShowToust(Text: state.error, state: ToustStates.ERROR);
          // if (state.loginModel.status) {
          //   CashHelper.SaveData(
          //           key: 'token', value: state.loginModel.data!.token)
          //       .then((value) {
          //     token = state.loginModel.data!.token;
          //     print('save token');
          //     NavAndFinish(context, HomeScreen());
          //     ShowToust(
          //         Text: state.loginModel.message, state: ToustStates.SUCSESS);
          //   });
          // } else {
          //   ShowToust(
          //       Text: state.loginModel.message, state: ToustStates.ERROR);
          // }
          // } else if (state is LoginSucssesState) {
          //   NavAndFinish(context, HomeScreen());
          // }
          if (state is LoginSucssesState) {
            CashHelper.SaveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              NavTo(
                context,
                HomeScreen(),
              );
            });
          }
          if (state is LoginErrorState) {
            ShowToust(
              Text: state.error,
              state: ToustStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 20.0, bottom: 20, end: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 25.h,
                              width: double.infinity,
                              child: Image.asset(
                                down,
                              ),
                            ),
                            const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'سجل الان  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onTap: () {},
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'من فضلك ادخل البريد الالكتروني';
                                } else if (!LoginCubit.get(context)
                                    .legalEmail(emailController.text)) {
                                  return 'من فضلك ادخل بريد الكنروني صحيح ';
                                }
                              },
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).UserLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.email,
                                  ),
                                  labelText: 'البريد الالكتروني',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText:
                                  LoginCubit.get(context).isPasswordShow,
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).UserLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'من فضلك ادخل كلمة المرور';
                                }
                              },
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: LoginCubit.get(context).suffix,
                                    onPressed: () {
                                      LoginCubit.get(context)
                                          .ChangePaswordVisibility();
                                    },
                                  ),
                                  labelText: 'كلمة المرور',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLodingState,
                              builder: (context) => Container(
                                width: double.infinity,
                                height: 6.5.h,
                                color: DefaultColor,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).UserLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  child: const Text(
                                    'سجل',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'ليس لديك حساب الكتروني؟',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    NavTo(context, RegisterScreen());
                                  },
                                  child: const Text('انشئ حساب'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
