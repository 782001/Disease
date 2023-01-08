import 'package:diseases/core/utils/app_theme_colors.dart';
import 'package:diseases/presination/controller/app_states.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/assets_images_path.dart';
import '../controller/app_cubit.dart';
import '../widgets/diseases_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_launcher/maps_launcher.dart';

class HomeDiseasesModel {
  final String icon;
  final String title;
  final int id;

  HomeDiseasesModel({
    required this.icon,
    required this.title,
    required this.id,
  });
}

List<HomeDiseasesModel> HomeList = [
  HomeDiseasesModel(icon: down, title: HomeStrings.downTitle, id: 1),
  HomeDiseasesModel(icon: west, title: HomeStrings.westTitle, id: 2),
  HomeDiseasesModel(icon: ret, title: HomeStrings.retTitle, id: 3),
];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Uri _url = Uri.parse(
    "https://www.google.com/maps/place/%D8%AC%D9%85%D8%B9%D9%8A%D8%A9+%D8%A7%D8%A8%D8%A7%D8%A1+%D9%88%D8%A7%D8%A8%D9%86%D8%A7%D8%A1+%D9%84%D8%B1%D8%B9%D8%A7%D9%8A%D8%A9+%D8%A7%D9%84%D9%85%D8%B9%D8%A7%D9%82%D9%8A%D9%86+%D8%B0%D9%87%D9%86%D9%8A%D8%A7%E2%80%AD/@30.0687213,31.2801656,16z/data=!3m1!4b1!4m5!3m4!1s0x14584091e777572b:0x2ce70b21b1672250!8m2!3d30.0687213!4d31.2801656",
  );
  Future<void> GoLocation(_urlL) async {
    if (!await launchUrl(_urlL)) {
      throw 'Could not launch $_urlL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 35.h,
              backgroundColor: Colors.white,

              // pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'الامراض الوراثيه',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                background: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // AppColors.kTealColor,
                          AppColors.kBuleColor, Colors.purple
                        ],
                      ),
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(25),
                          bottomEnd: Radius.circular(25))),
                ),
              )),
          BuildDiseases(),
        ],
      ),
    );
  }
}

class BuildDiseases extends StatelessWidget {
  BuildDiseases({super.key});
  final Uri _url = Uri.parse(
    "https://www.google.com/maps/place/%D8%AC%D9%85%D8%B9%D9%8A%D8%A9+%D8%A7%D8%A8%D8%A7%D8%A1+%D9%88%D8%A7%D8%A8%D9%86%D8%A7%D8%A1+%D9%84%D8%B1%D8%B9%D8%A7%D9%8A%D8%A9+%D8%A7%D9%84%D9%85%D8%B9%D8%A7%D9%82%D9%8A%D9%86+%D8%B0%D9%87%D9%86%D9%8A%D8%A7%E2%80%AD/@30.0687213,31.2801656,16z/data=!3m1!4b1!4m5!3m4!1s0x14584091e777572b:0x2ce70b21b1672250!8m2!3d30.0687213!4d31.2801656",
  );
  Future<void> GoLocation(_urlL) async {
    if (!await launchUrl(_urlL)) {
      throw 'Could not launch $_urlL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    int TouchIndex = HomeList[index].id;
                    return DiseasesWidget(
                      diseasesModel: HomeList[index],
                      TouchIndex: TouchIndex,
                    );
                  },
                  itemCount: HomeList.length),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    GoLocation(_url);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.kGreyColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ابحث عن موقع',
                          style: TextStyle(fontSize: 18, color: Colors.teal),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
