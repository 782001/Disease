import 'package:diseases/core/utils/app_theme_colors.dart';
import 'package:diseases/core/utils/assets_images_path.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'HomeScreen.dart';

class Diseases2 extends StatelessWidget {
  const Diseases2({
    Key? key,
    required this.diseasModel,
  }) : super(key: key);
  final HomeDiseasesModel diseasModel;
  @override
  Widget build(BuildContext context) {
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
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 20.h,
                      // width: 20.w,

                      decoration: BoxDecoration(
                        color: AppColors.kTealColor,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 10.h, child: Image.asset(down)),
                          Text(
                            ' التعامل مع المرض',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white),
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
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 20.h,
                      // width: 20.w,

                      decoration: BoxDecoration(
                        color: AppColors.kTealColor,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 10.h, child: Image.asset(down)),
                          Text(
                            'الصور',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: AppColors.kwhite,
                            ),
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
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 20.h,
                      // width: 20.w,

                      decoration: BoxDecoration(
                        color: AppColors.kTealColor,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 10.h, child: Image.asset(down)),
                          Text(
                            'سلوكيات المرض',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white),
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
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 20.h,
                      // width: 20.w,

                      decoration: BoxDecoration(
                        color: AppColors.kTealColor,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 10.h, child: Image.asset(down)),
                          Text(
                            'العلاج',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white),
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
  }
}
