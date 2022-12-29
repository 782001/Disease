import 'package:diseases/core/utils/app_theme_colors.dart';
import 'package:diseases/presination/controller/app_states.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/assets_images_path.dart';
import '../controller/app_cubit.dart';
import '../widgets/diseases_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('الامراض الوراثيه'),
      //   centerTitle: true,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //       colors: [
      //         // AppColors.kTealColor,
      //         AppColors.kBuleColor, Colors.purple
      //       ],
      //     )),
      //   ),
      // ),
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
          const BuildDiseases(),
        ],
      ),
    );
  }
}

class BuildDiseases extends StatelessWidget {
  const BuildDiseases({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: ListView.builder(
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
        );
      },
    );
  }
}
