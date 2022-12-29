import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../../models/rer_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';

class ShowRetProceduresScreen extends StatelessWidget {
  const ShowRetProceduresScreen({
    Key? key,
    required this.retproceduresModel,
  }) : super(key: key);
  final RetData? retproceduresModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Center(child: Text(" اجرائات وفحوصات ")),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomText(
                          text:
                              "${retproceduresModel!.retProcedures!.first.proText1}",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          size: 15.sp,
                          maxLines: 10,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: AppColors.BGreyIconColor,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomText(
                          text:
                              "${retproceduresModel!.retProcedures!.first.proText2}",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          size: 15.sp,
                          maxLines: 10,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomText(
                          text:
                              "${retproceduresModel!.retProcedures!.first.proText3}",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          size: 15.sp,
                          maxLines: 10,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomText(
                          text:
                              "${retproceduresModel!.retProcedures!.first.proText4}",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          size: 15.sp,
                          maxLines: 10,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomText(
                          text:
                              "${retproceduresModel!.retProcedures!.first.proText5}",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          size: 15.sp,
                          maxLines: 10,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: AppColors.BGreyIconColor,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomText(
                          text:
                              "${retproceduresModel!.retProcedures!.first.proText6}",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          size: 15.sp,
                          maxLines: 10,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: AppColors.BGreyIconColor,
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
