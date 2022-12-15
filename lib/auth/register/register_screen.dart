// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:diseases/presination/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/shared/components.dart';
import 'register_cubit/register_cubit.dart';
import 'register_cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          // if (state is RegisterSuccessState) {
          //   NavAndFinish(context, HomeScreen());
          // ShowToust(Text: 'البريد الالكترونيد', state: ToustStates.ERROR);
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
          // } else {
          //   ShowToust(
          //       Text:
          //           'البريد الالكتروني غير صحيح او تم تسجيله من قبل برجاء التأكد',
          //       state: ToustStates.ERROR);
          // }

          if (state is CreateUserSuccessState) {
            // CashHelper.SaveData(
            //   key: 'uId',
            //   value: state.uId,
            // ).then((value) {
            //   NavAndFinish(
            //     context,
            //     HomeScreen(),
            //   );
            // });
            NavTo(
              context,
              HomeScreen(),
            );
          }
          // if (state is RegisterErrorState) {
          //   ShowToust(
          //     Text: state.error,
          //     state: ToustStates.ERROR,
          //   );
          // }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'انشئ حساب',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'انشئ حساب الان  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            onTap: () {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل الاسم';
                              } else if (value.length < 3) {
                                return 'الاسم يجب ان تكون اكثر من 3 مدخلات';
                              }
                            },
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.text_fields_rounded,
                                ),
                                labelText: 'الاسم',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
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
                              } else if (!RegisterCubit.get(context)
                                  .legalEmail(emailController.text)) {
                                return 'من فضلك ادخل بريد الكنروني صحيح ';
                              }
                            },
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
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
                                RegisterCubit.get(context).isPasswordShow,
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل كلمة المرور';
                              } else if (value.length < 9) {
                                return 'كلمة المرور يجب ان تكون اكثر من 9 مدخلات';
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                  icon: RegisterCubit.get(context).suffix,
                                  onPressed: () {
                                    RegisterCubit.get(context)
                                        .ChangeRegisterPaswordVisibility();
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
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            onTap: () {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل  رقم الهاتف';
                              } else if (value.length < 11) {
                                return 'كلمة المرور يجب ان تكون اكثر من 11 رقم';
                              }
                            },
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone,
                                ),
                                labelText: 'الهاتف',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => Container(
                              width: double.infinity,
                              color: DefaultColor,
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                child: const Text(
                                  'انشئ حساب',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ],
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
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop/all_register_screen/register_cubit/register_cubit.dart';
// import 'package:shop/all_register_screen/register_cubit/register_states.dart';
// import 'package:shop/network/local/cashhelper.dart';
// import 'package:shop/shared/components.dart';
//
// import '../all_login_cubit/login.dart';
//
//
// class RegisterScreen extends StatelessWidget {
//   RegisterScreen({Key? key}) : super(key: key);
//
//   var formKey = GlobalKey<FormState>();
//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var confirmController = TextEditingController();
//   var phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => RegisterCubit(),
//       child: BlocConsumer<RegisterCubit, RegisterStates>(
//         listener: (BuildContext context, state) {
//           if(state is RegisterSuccessState){
//             if(state.loginModel.status){
//               CashHelper.SaveData(
//                 key: 'token',
//                 value: state.loginModel.data!.token,
//               ).then((value) {
//                 NavAndFinish(context, LoginScreen());
//               });
//               ShowToust(
//
//                 state: ToustStates.SUCSESS,
//                 Text: state.loginModel.message,
//               );
//             }
//             else{
//               ShowToust(
//
//                 state: ToustStates.ERROR,
//                 Text: state.loginModel.message,
//               );
//             }
//           }
//         },
//         builder: (BuildContext context, Object? state) {
//           return  Scaffold(
//             appBar: AppBar(),
//             body: Center(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'REGISTER',
//                           style: Theme.of(context).textTheme.headline4!.copyWith(
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         Text(
//                           'Register now to browse our hot offers',
//                           style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30.0,
//                         ),
//                         defaultFormField(
//                           controller: nameController,
//                           type: TextInputType.name,
//                           validate: (String? value){
//                             if(value!.isEmpty){
//                               return 'please enter your name';
//                             }
//                             else if(value.length < 8){
//                               return 'name must be more than 8 characters';
//                             }
//                             return null;
//                           },
//                           label: 'User Name',
//                           prefix: Icons.person,
//                         ),
//
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         defaultFormField(
//                           controller: emailController,
//                           type: TextInputType.emailAddress,
//                           validate: (String? value){
//                             if(value!.isEmpty){
//                               return 'please enter your email address';
//                             }
//                             else if(!RegisterCubit.get(context).legalEmail(emailController.text)){
//                               return 'enter valid email';
//                             }
//                             return null;
//                           },
//                           label: 'Email Address',
//                           prefix: Icons.email,
//                         ),
//
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         defaultFormField(
//                           controller: passwordController,
//                           type: TextInputType.visiblePassword,
//                           isPassword: RegisterCubit.get(context).isPassword,
//                           validate: (String? value){
//                             if(value!.isEmpty){
//                               return 'please enter your password';
//                             }
//                             else if(value.length < 9){
//                               return 'Password must be more than 9 numbers';
//                             }
//                             return null;
//                           },
//                           label: 'Password',
//                           suffix: RegisterCubit.get(context).suffix,
//                           suffixPressed: (){
//                             RegisterCubit.get(context).changePasswordVisibility();
//                           },
//                           prefix: Icons.lock,
//                         ),
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         defaultFormField(
//                           controller: confirmController,
//                           type: TextInputType.visiblePassword,
//                           isPassword: RegisterCubit.get(context).isConfirmPassword,
//                           validate: (String? value){
//                             if(value!.isEmpty){
//                               return 'please enter your password';
//                             }
//                             else if(value != passwordController.text){
//                               return 'Confirm password is wrong';
//                             }
//                             return null;
//                           },
//                           label: 'Confirm Password',
//                           suffix: RegisterCubit.get(context).confirmSuffix,
//                           suffixPressed: (){
//                             RegisterCubit.get(context).changeConfirmPasswordVisibility();
//                           },
//                           prefix: Icons.lock,
//                         ),
//
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//
//                         defaultFormField(
//                           controller: phoneController,
//                           type: TextInputType.phone,
//                           validate: (String? value){
//                             if(value!.isEmpty){
//                               return 'please enter your phone';
//                             }
//                             else if(value.length < 11){
//                               return 'Phone must be not less than 11 numbers';
//                             }
//                             return null;
//                           },
//                           label: 'Phone',
//                           prefix: Icons.phone,
//                         ),
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         ConditionalBuilder(
//                           condition: state is! RegisterLoadingState,
//                           builder: (BuildContext context) =>Container(
//                               width: double.infinity,
//
//                               color: DefaultColor,
//                               child: MaterialButton(
//                                 onPressed: (){
//                                   if(formKey.currentState!.validate()){
//                                     RegisterCubit.get(context).userRegister(
//                                       email: emailController.text,
//                                       password: passwordController.text,
//                                       name: nameController.text,
//                                       phone: phoneController.text,
//                                     );
//
//                                   }
//                                 },
//                                 child: const Text('REGISTER',
//                                   style: TextStyle(
//                                     color: Colors.white,
//
//                                   ),
//                                 ),
//
//                               )
//
//                         ),
//                           fallback: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
//                            )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
