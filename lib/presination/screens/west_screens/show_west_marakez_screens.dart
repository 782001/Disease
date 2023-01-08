import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../../core/shared/components.dart';
import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../../models/west_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';

class ShowWestMarakezScreens extends StatelessWidget {
  ShowWestMarakezScreens({
    Key? key,
    required this.westmarakezModel,
  }) : super(key: key);
  final WestData? westmarakezModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final WestMarakez? westmarakez = AppCubit.get(context)
          //     .westModel!
          //     .westData!
          //     .westMarakez![1 & 0 & 2];
          // final Uri _url1 = Uri.parse(
          //   "${westmarakez!.mara_loc1!}",
          // );
          return Scaffold(
              appBar: AppBar(
                title: const Center(child: Text(" مراكز العلاج ")),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // int? Index = westmarakezModel!.westMarakez![index].id;
                    return WestMaraWidget(
                      // _url1,
                      westmarakezModel!.westMarakez![index],
                    );
                  },
                  itemCount: westmarakezModel!.westMarakez!.length,
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

  Container WestMaraWidget(WestMarakez? WestMarakezModel) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.greyLight,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "${WestMarakezModel!.maraTitle1!}",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  size: 15.sp,
                  maxLines: 10,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomText(
                  text: "رقم الهاتف:   ${WestMarakezModel.maraPhone1!}",
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  size: 15.sp,
                  maxLines: 10,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: double.infinity,
                  height: 6.5.h,
                  color: DefaultColor,
                  child: MaterialButton(
                    onPressed: () {
                      // MapsLauncher.launchCoordinates(
                      //     30.069027704643347, 31.2801226846589
                      //     // marakezModel!
                      //     //     .marakez!.first.maralat1!,
                      //     // marakezModel!
                      //     //     .marakez!.first.maralong1!
                      //     );
                      // MapsLauncher.launchCoordinates(
                      //     37.4220041,
                      //     -122.0862462,
                      //     'Google Headquarters are here');
                      // GoLocation(_url1);
                      GoLocation(Uri.parse(
                        "${WestMarakezModel!.mara_loc1!}",
                      ));
                    },
                    child: const Text(
                      'اذهب للموقع',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> GoLocation(_urlL) async {
    if (!await launchUrl(_urlL)) {
      throw 'Could not launch $_urlL';
    }
  }

//   // https://maps.app.goo.gl/KhGzJsHtd3X2hiJi7
//   Future<void> GoLoc() async {
//     if (!await launchUrl(_url)) {
//       throw 'Could not launch $_url';
//     }
//   }
}

// void navigateTo(double lat, double lng) async {
//   var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
//   if (await canLaunch(uri.toString())) {
//     await launch(uri.toString());
//   } else {
//     throw 'Could not launch ${uri.toString()}';
//   }
// }

// Future<void> openMap(double latitude, double longitude) async {
//   String googleUrl =
//       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//   if (await canLaunch(googleUrl)) {
//     await launch(googleUrl);
//   }
// }
