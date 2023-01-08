import 'package:diseases/models/down_data_model.dart';
import 'package:flutter/widgets.dart';

import '../../core/utils/app_theme_colors.dart';
import '../../core/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

Widget DownComuncationWidget(DownCommunication? comuncationModel) {
  return Column(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: CustomText(
          text: "${comuncationModel!.comuText1!}",
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
