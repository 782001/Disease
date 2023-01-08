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
    required this.westsymptoms,
    required this.westphotoModel,
  }) : super(key: key);
  final WestData? westsymptoms;
  final WestData? westphotoModel;
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
                        itemBuilder: (context, index) => WestSymotoWidget(
                            westsymptoms!.westSymptoms![index]),
                        itemCount: westsymptoms!.westSymptoms!.length,
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
                            WestPhotoWidget(westphotoModel!.westPhoto![index]),
                        itemCount: westphotoModel!.westPhoto!.length,
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  Widget WestPhotoWidget(WestPhoto? westphotoModel) {
    return SizedBox(
      width: 90.w,
      height: 60.h,
      child: Image(
          fit: BoxFit.contain,
          image: NetworkImage(
            "${westphotoModel!.photo1}",
          )),
    );
  }

  Widget WestSymotoWidget(WestSymptoms? westsymptomsModel) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomText(
        text: "${westsymptomsModel!.symText1}",
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        size: 15.sp,
        maxLines: 10,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
