import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/down_data_model.dart';

import '../../models/rer_data_model.dart';
import '../../models/west_data_model.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  DownModel? downModel;

  void GetDownData() {
    emit(GetDownLoadingState());
    FirebaseFirestore.instance
        .collection('diseases')
        .doc('down')
        .get()
        .then((value) {
      downModel = DownModel.fromJson(value.data()!);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data()}');
      // print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${westModel!.data!.photo}');

      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel!.downData!.procedures}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel!.downData!.symptoms[0]}');

      emit(GetDownSucssesState());
    }).catchError((error) {
      print(
          'erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(GetDownErrorState(error.toString()));
    });
  }

  WestModel? westModel;
  void GetWestData() {
    emit(GetWestLoadingState());
    FirebaseFirestore.instance
        .collection('diseases')
        .doc('west')
        .get()
        .then((value) {
      westModel = WestModel.fromJson(value.data()!);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data()}');
      // print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${westModel!.data!.photo}');

      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel!.downData!.procedures}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel!.downData!.symptoms[0]}');

      emit(GetWestSucssesState());
    }).catchError((error) {
      print(
          'erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(GetWestErrorState(error.toString()));
    });
  }

  RetModel? retModel;
  void GetRetData() {
    emit(GetRetLoadingState());
    FirebaseFirestore.instance
        .collection('diseases')
        .doc('ret')
        .get()
        .then((value) {
      retModel = RetModel.fromJson(value.data()!);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data()}');
      // print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${westModel!.data!.photo}');

      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel!.downData!.procedures}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${downModel!.downData!.symptoms[0]}');

      emit(GetRetSucssesState());
    }).catchError((error) {
      print(
          'erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(GetRetErrorState(error.toString()));
    });
  }
}
