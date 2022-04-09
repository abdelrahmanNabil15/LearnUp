// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/modules/Profile/cubit/state.dart';
import 'package:untitled2/modules/login/Loginscreen.dart';
import 'package:untitled2/network/CacheHelper.dart';

import '../../../model/User_model.dart';
import '../../../network/DioHelper.dart';
import '../../../network/end_pionts.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UserDataCubit() : super(UserDataInitialState());
  Usermodel? usermodel;
  dynamic token = CacheHelper.getData(key: 'result');

  static UserDataCubit get(context) => BlocProvider.of(context);

  void GetUserdata() {
    emit(UserDataLoadingState());
    DioHelper.getData(url: User, token: token).then((value) {
      usermodel = Usermodel.fromJson(value.data);

      emit(UserDataSuccessState(usermodel!));
    }).catchError((error) {
      if (error.response != null) {
        print(token);
        print('Dio error!');
        print('STATUS: ${error.response?.statusCode}');
        print('DATA: ${error.response?.data}');
        print('HEADERS: ${error.response?.headers}');
        print(token);
        emit(UserDataErrorState());
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(error.message);

        emit(UserDataErrorState());
      }
    });
  }

  void SignOut(context) {
    CacheHelper.removeData(key: 'token').then((value) {
      if (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }}
    );
  }

}