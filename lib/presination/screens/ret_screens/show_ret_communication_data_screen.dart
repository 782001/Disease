import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../../models/rer_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';

class ShowRetCommunicationDataScreen extends StatelessWidget {
  const ShowRetCommunicationDataScreen({
    Key? key,
    required this.retcomuncationModel,
  }) : super(key: key);
  final RetData? retcomuncationModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Center(child: Text("التعامل مع المتلازمه")),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => RetComuncationWidget(
                      retcomuncationModel!.retCommunication![index]),
                  itemCount: retcomuncationModel!.retCommunication!.length,
                ),
              ));
        });
  }

  Widget RetComuncationWidget(RetCommunication? retcomuncationModel) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: CustomText(
            text: "${retcomuncationModel!.comuText1!}",
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
      ],
    );
  }
}
