import 'package:diseases/core/shared/components.dart';
import 'package:diseases/core/utils/app_theme_colors.dart';
import 'package:diseases/presination/screens/diseases2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/HomeScreen.dart';

class DiseasesWidget extends StatelessWidget {
  const DiseasesWidget({
    super.key,
    required this.diseasesModel,
    required this.TouchIndex,
  });
  final HomeDiseasesModel diseasesModel;
  final int TouchIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavTo(
            context,
            Diseases2(
              diseasModel: diseasesModel,
              TouchIndex: TouchIndex,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 10.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.kGreyColor,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 7.h,
                  width: 50.w,
                  child: Text(
                    diseasesModel.title,
                    style: TextStyle(
                        fontSize: 4.h,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Container(
                  height: 7.h,
                  width: 2.w,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                    height: 17.h,
                    width: 17.w,
                    child: Image.asset(
                      diseasesModel.icon,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
