import 'package:untitled2/model/User_model.dart';

abstract class UserDataStates {}

class UserDataInitialState extends UserDataStates {}

class UserDataLoadingState extends UserDataStates {}

class UserDataSuccessState extends UserDataStates {
  final Usermodel usermodel;

  UserDataSuccessState(this.usermodel);
}

class UserDataErrorState extends UserDataStates {}