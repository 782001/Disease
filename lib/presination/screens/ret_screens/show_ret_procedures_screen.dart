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
                child: ListView.separated(
                  itemBuilder: (context, index) => RetProWidget(
                    retproceduresModel!.retProcedures![index],
                  ),
                  itemCount: retproceduresModel!.retProcedures!.length,
                  separatorBuilder: (BuildContext context, int index) => Column(
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
              ));
        });
  }

  Directionality RetProWidget(RetProcedures? retproceduresModel) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomText(
        text: "${retproceduresModel!.proText1}",
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        size: 15.sp,
        maxLines: 10,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
