import 'package:diseases/auth/login/login_screen.dart';
import 'package:diseases/core/utils/app_strings.dart';
import 'package:diseases/core/utils/app_theme_colors.dart';
import 'package:diseases/core/utils/assets_images_path.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/network/local/cashhelper.dart';
import '../../core/shared/components.dart';
import 'HomeScreen.dart';

class BordingScreen extends StatefulWidget {
  const BordingScreen({Key? key}) : super(key: key);

  @override
  _BordingScreenState createState() => _BordingScreenState();
}

class BordingModel {
  final String image;
  final String title;
//   final String image;
//   final String title;
  final String description;

//   PageViewModel(this.image, this.title, );
  BordingModel(
      {required this.image, required this.title, required this.description});
}

class _BordingScreenState extends State<BordingScreen> {
  List<BordingModel> bording = [
    BordingModel(
        image: down,
        title: BordingStrings.downTitle,
        description: BordingStrings.downDec),
    BordingModel(
      image: west,
      title: BordingStrings.westTitle,
      description: BordingStrings.westDec,
    ),
    BordingModel(
        image: ret,
        title: BordingStrings.retTitle,
        description: BordingStrings.retDec)
  ];
  void Submit() {
    CashHelper.SaveData(key: 'onBording', value: true).then((value) {
      if (value) {
        print('on Bording save true');
        // NavAndFinish(context, HomeScreen());
        NavAndFinish(context, LoginScreen());
      }
    });
  }

  var bordingController = PageController();
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Submit();
              },
              child: const Text('تخطي')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: bordingController,
                onPageChanged: (int index) {
                  if (index == bording.length - 1) {
                    setState(() {
                      islast = true;
                    });
                  } else {
                    setState(() {
                      islast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    Build_Bording_Item(bording[index]),
                itemCount: bording.length,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 7.w,
                ),
                SmoothPageIndicator(
                    controller: bordingController,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        activeDotColor: Colors.amber,
                        dotWidth: 10),
                    count: bording.length),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (islast) {
                      Submit();
                    } else {
                      bordingController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Build_Bording_Item(BordingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            // fit: BoxFit.contain,
            image: AssetImage(
              '${model.image}',
            ),
            height: 25.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            '${model.description}',
            style: TextStyle(
              fontSize: 16.sp,
              // fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      );
}

// import 'package:diseases/core/utils/media_query_values.dart';
// import 'package:diseases/presination/screens/HomeScreen.dart';
// import 'package:flutter/material.dart';

// import '../../core/utils/assets_images_path.dart';

// class OnBoardingScreen extends StatelessWidget {
//   OnBoardingScreen({Key? key}) : super(key: key);
//   final pageController = PageController();
//   final List<PageViewModel> pages = [
//     PageViewModel(practice, 'Plan your trips',
//         'Book one of your unique hotel to escape the ordinary'),
//     PageViewModel(cold, 'Find best deals',
//         'Find deals for any season from cosy country homes to city flats'),
//     PageViewModel(
//       down,
//       'Best travelling all time',
//       'Find deals for any season from cosy country homes to city flats',
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: context.height * 0.1),
//             Expanded(
//               child: PageView.builder(
//                 itemBuilder: (context, index) {
//                   return buildPageView(pages[index]);
//                 },
//                 controller: pageController,
//                 itemCount: pages.length,
//                 physics: const BouncingScrollPhysics(),
//               ),
//             ),
//             // SmoothPageIndicator(
//             //   controller: pageController,
//             //   count: pages.length,
//             //   effect: WormEffect(
//             //       dotColor: Colors.grey.shade300,
//             //       activeDotColor: const Color(0xff4FBE9E),
//             //       dotWidth: 18,
//             //       dotHeight: 6),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildPageView(PageViewModel page) => Column(
//         children: [
//           Image.asset(
//             page.image,
//             height: 400,
//           ),
//           Text(
//             page.title,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               overflow: TextOverflow.ellipsis,
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             page.description,
//             style: const TextStyle(
//               fontSize: 14,
//               overflow: TextOverflow.ellipsis,
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 3,
//           )
//         ],
//       );
// }

// class PageViewModel {
//   final String image;
//   final String title;
//   final String description;

//   PageViewModel(this.image, this.title, this.description);
// }
