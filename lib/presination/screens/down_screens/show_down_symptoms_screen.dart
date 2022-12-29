import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';

class ShowDownSymptomsDataScreen extends StatelessWidget {
  const ShowDownSymptomsDataScreen({
    Key? key,
    required this.downsymptoms_photoModel,
  }) : super(key: key);
  final DownData? downsymptoms_photoModel;
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
                              "${downsymptoms_photoModel!.downSymptoms!.first.symText1}",
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
                              "${downsymptoms_photoModel!.downPhoto!.first.photo1}",
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
                              "${downsymptoms_photoModel!.downPhoto!.first.photo2}",
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
                              "${downsymptoms_photoModel!.downPhoto!.first.photo3}",
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
                              "${downsymptoms_photoModel!.downPhoto!.first.photo4}",
                            )),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
