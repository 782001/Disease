import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../../models/rer_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';

class ShowRetSymptomsDataScreen extends StatelessWidget {
  const ShowRetSymptomsDataScreen({
    Key? key,
    required this.retsymptoms,
    required this.retphotoModel,
  }) : super(key: key);
  final RetData? retsymptoms;
  final RetData? retphotoModel;
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
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            RetSymotoWidget(retsymptoms!.retSymptoms![index]),
                        itemCount: retsymptoms!.retSymptoms!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Column(
                          children: [
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
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            RetPhotoWidget(retphotoModel!.retPhoto![index]),
                        itemCount: retphotoModel!.retPhoto!.length,
                        // separatorBuilder: (BuildContext context, int index) =>
                        //     //     Column(
                        //     //   children: [
                        //     //     SizedBox(
                        //     //       height: 5.h,
                        //     //     ),
                        //     //     Container(
                        //     //       width: double.infinity,
                        //     //       height: 2,
                        //     //       color: AppColors.BGreyIconColor,
                        //     //     ),
                        //     //     SizedBox(
                        //     //       height: 5.h,
                        //     //     ),
                        //     //   ],
                        //     // ),

                        //     Container()
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  Widget RetPhotoWidget(RetPhoto? retphotoModel) {
    return SizedBox(
      width: 90.w,
      height: 60.h,
      child: Image(
          fit: BoxFit.contain,
          image: NetworkImage(
            "${retphotoModel!.photo1}",
          )),
    );
  }

  Widget RetSymotoWidget(RetSymptoms? retsymptomsModel) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomText(
        text: "${retsymptomsModel!.symText1}",
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        size: 15.sp,
        maxLines: 10,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
