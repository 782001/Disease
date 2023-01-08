import 'package:diseases/core/shared/components.dart';
import 'package:diseases/core/utils/app_theme_colors.dart';
import 'package:diseases/core/utils/assets_images_path.dart';
import 'package:diseases/models/down_data_model.dart';
import 'package:diseases/presination/screens/ret_screens/show_ret_communication_data_screen.dart';
import 'package:diseases/presination/screens/ret_screens/show_ret_marakez_screens.dart';
import 'package:diseases/presination/screens/ret_screens/show_ret_procedures_screen.dart';
import 'package:diseases/presination/screens/ret_screens/show_ret_symptoms_screen.dart';

import 'package:diseases/presination/screens/west_screens/show_west_communication_data_screen.dart';
import 'package:diseases/presination/screens/west_screens/show_west_marakez_screens.dart';
import 'package:diseases/presination/screens/west_screens/show_west_procedures_screen.dart';
import 'package:diseases/presination/screens/west_screens/show_west_symptoms_screen.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/widgets/custom_text.dart';
import '../../models/rer_data_model.dart';
import '../../models/west_data_model.dart';
import '../controller/app_cubit.dart';
import '../controller/app_states.dart';
import 'HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'down_screens/show_down_communication_data_screen.dart';
import 'down_screens/show_down_marakez_screens.dart';
import 'down_screens/show_down_procedures_screen.dart';
import 'down_screens/show_down_symptoms_screen.dart';

class Diseases2 extends StatelessWidget {
  const Diseases2({
    Key? key,
    required this.diseasModel,
    required this.TouchIndex,
  }) : super(key: key);
  final HomeDiseasesModel diseasModel;
  final int TouchIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        DownData? downcomuncationModel =
            AppCubit.get(context).downModel?.downData;
        DownData? downmarakezModel = AppCubit.get(context).downModel?.downData;
        DownData? downproceduresModel =
            AppCubit.get(context).downModel?.downData;
        DownData? downsympots_Model = AppCubit.get(context).downModel?.downData;
        DownData? down_photo_Model = AppCubit.get(context).downModel?.downData;
        WestData? westcomuncationModel =
            AppCubit.get(context).westModel?.westData;
        WestData? westmarakezModel = AppCubit.get(context).westModel?.westData;

        WestData? westproceduresModel =
            AppCubit.get(context).westModel?.westData;
        WestData? west_photo_Model = AppCubit.get(context).westModel?.westData;
        WestData? westsympots_Model = AppCubit.get(context).westModel?.westData;
        RetData? retcomuncationModel = AppCubit.get(context).retModel?.retData;
        RetData? retmarakezModel = AppCubit.get(context).retModel?.retData;
        RetData? retproceduresModel = AppCubit.get(context).retModel?.retData;
        RetData? retsympots_Model = AppCubit.get(context).retModel?.retData;
        RetData? ret_photo_Model = AppCubit.get(context).retModel?.retData;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              diseasModel.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 50.0,
              start: 20,
              end: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (TouchIndex == 1) {
                            NavTo(
                                context,
                                ShowDownCommunicationDataScreen(
                                  downcomuncationModel: downcomuncationModel,
                                ));
                          } else if (TouchIndex == 2) {
                            NavTo(
                                context,
                                ShowWestCommunicationDataScreen(
                                  westcomuncationModel: westcomuncationModel,
                                ));
                          } else {
                            NavTo(
                                context,
                                ShowRetCommunicationDataScreen(
                                  retcomuncationModel: retcomuncationModel,
                                ));
                          }
                          print(TouchIndex);
                        },
                        child: Container(
                          height: 25.h,
                          // width: 20.w,

                          decoration: BoxDecoration(
                            color: AppColors.kTealColor,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(height: 10.h, child: Image.asset(down)),
                              CustomText(
                                text: ' التعامل مع المتلازمه',
                                color: AppColors.kWhiteColor,
                                fontWeight: FontWeight.bold,
                                size: 15.sp,
                                maxLines: 3,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (TouchIndex == 1) {
                            NavTo(
                                context,
                                ShowDownSymptomsDataScreen(
                                  downsymptoms: downsympots_Model,
                                  photoModel: down_photo_Model,
                                ));
                          } else if (TouchIndex == 2) {
                            NavTo(
                                context,
                                ShowWestSymptomsDataScreen(
                                  westphotoModel: west_photo_Model,
                                  westsymptoms: westsympots_Model,
                                ));
                          } else {
                            NavTo(
                                context,
                                ShowRetSymptomsDataScreen(
                                  retphotoModel: ret_photo_Model,
                                  retsymptoms: retsympots_Model,
                                ));
                          }
                          print(TouchIndex);
                        },
                        child: Container(
                          height: 25.h,
                          // width: 20.w,

                          decoration: BoxDecoration(
                            color: AppColors.kTealColor,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(height: 10.h, child: Image.asset(down)),
                              CustomText(
                                text: ' الاعراض والصور',
                                color: AppColors.kWhiteColor,
                                fontWeight: FontWeight.bold,
                                size: 15.sp,
                                maxLines: 3,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (TouchIndex == 1) {
                            NavTo(
                                context,
                                ShowDownProceduresScreen(
                                  downproceduresModel: downproceduresModel,
                                ));
                          } else if (TouchIndex == 2) {
                            NavTo(
                                context,
                                ShowWestProceduresScreen(
                                  westproceduresModel: westproceduresModel,
                                ));
                          } else {
                            NavTo(
                                context,
                                ShowRetProceduresScreen(
                                  retproceduresModel: retproceduresModel,
                                ));
                          }
                          print(TouchIndex);
                        },
                        child: Container(
                          height: 25.h,
                          // width: 20.w,

                          decoration: BoxDecoration(
                            color: AppColors.kTealColor,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(height: 10.h, child: Image.asset(down)),
                              CustomText(
                                text: "اجرائات وفحصوصات",
                                color: AppColors.kWhiteColor,
                                fontWeight: FontWeight.bold,
                                size: 14.sp,
                                maxLines: 3,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (TouchIndex == 1) {
                            NavTo(
                                context,
                                ShowDownMarakezScreens(
                                  downmarakezModel: downmarakezModel,
                                ));
                          } else if (TouchIndex == 2) {
                            NavTo(
                                context,
                                ShowWestMarakezScreens(
                                  westmarakezModel: westmarakezModel,
                                  // westmarakez: null,
                                ));
                          } else {
                            NavTo(
                                context,
                                ShowRetMarakezScreens(
                                  retmarakezModel: retmarakezModel,
                                ));
                          }
                          print(TouchIndex);
                        },
                        child: Container(
                          height: 25.h,
                          // width: 20.w,

                          decoration: BoxDecoration(
                            color: AppColors.kTealColor,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(height: 10.h, child: Image.asset(down)),
                              CustomText(
                                text: 'مراكز العلاج',
                                color: AppColors.kWhiteColor,
                                fontWeight: FontWeight.bold,
                                size: 18.sp,
                                maxLines: 3,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
