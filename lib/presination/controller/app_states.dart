import '../../../models/login_model.dart';

class AppStates {}

class AppInitialState extends AppStates {}

class GetDownLoadingState extends AppStates {}

class GetDownSucssesState extends AppStates {}

class GetDownErrorState extends AppStates {
  final String error;

  GetDownErrorState(this.error);
}

class GetRetLoadingState extends AppStates {}

class GetRetSucssesState extends AppStates {}

class GetRetErrorState extends AppStates {
  final String error;

  GetRetErrorState(this.error);
}

class GetWestLoadingState extends AppStates {}

class GetWestSucssesState extends AppStates {}

class GetWestErrorState extends AppStates {
  final String error;

  GetWestErrorState(this.error);
}
