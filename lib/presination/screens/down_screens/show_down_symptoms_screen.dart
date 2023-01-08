import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';

class ShowDownSymptomsDataScreen extends StatelessWidget {
  ShowDownSymptomsDataScreen({
    Key? key,
    required this.downsymptoms,
    required this.photoModel,
  }) : super(key: key);
  final DownData? downsymptoms;
  final DownData? photoModel;
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
                        itemBuilder: (context, index) =>
                            DownSymptoWid(downsymptoms!.downSymptoms![index]),
                        itemCount: downsymptoms!.downSymptoms!.length,
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
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            DownPhotoWidget(photoModel!.downPhoto![index]),
                        itemCount: photoModel!.downPhoto!.length,
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  Widget DownPhotoWidget(DownPhoto? downphotoModel) {
    return SizedBox(
      width: 90.w,
      height: 60.h,
      child: Image(
          fit: BoxFit.contain,
          image: NetworkImage(
            "${downphotoModel!.photo1}",
          )),
    );
  }

  Widget DownSymptoWid(DownSymptoms? downsymptomsModel) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomText(
        text: "${downsymptomsModel!.symText1}",
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        size: 15.sp,
        maxLines: 10,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
