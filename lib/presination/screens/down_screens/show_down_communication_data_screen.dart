import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_theme_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../models/down_data_model.dart';
import '../../controller/app_cubit.dart';
import '../../controller/app_states.dart';
import '../../widgets/down_com_widget.dart';

class ShowDownCommunicationDataScreen extends StatelessWidget {
  const ShowDownCommunicationDataScreen({
    Key? key,
    required this.downcomuncationModel,
  }) : super(key: key);
  final DownData? downcomuncationModel;
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
                      itemBuilder: (context, index) => DownComuncationWidget(
                          downcomuncationModel!.downCommunication![index]),
                      itemCount:
                          downcomuncationModel!.downCommunication!.length)));
        });
  }
}
