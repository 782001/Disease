import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../../models/west_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';

class ShowWestSymptomsDataScreen extends StatelessWidget {
  const ShowWestSymptomsDataScreen({
    Key? key,
    required this.westsymptoms_photoModel,
  }) : super(key: key);
  final WestData? westsymptoms_photoModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Center(child: Text("الاعراض والصور ")),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomText(
                          text:
                              "${westsymptoms_photoModel!.westSymptoms!.first.symText1}",
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
                              "${westsymptoms_photoModel!.westSymptoms!.first.symText2}",
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
                              "${westsymptoms_photoModel!.westSymptoms!.first.symText3}",
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
                              "${westsymptoms_photoModel!.westSymptoms!.first.symText4}",
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
                              "${westsymptoms_photoModel!.westSymptoms!.first.symText5}",
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
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              "${westsymptoms_photoModel!.westPhoto!.first.photo1}",
                            )),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: AppColors.BGreyIconColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              "${westsymptoms_photoModel!.westPhoto!.first.photo2}",
                            )),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: AppColors.BGreyIconColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              "${westsymptoms_photoModel!.westPhoto!.first.photo3}",
                            )),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
