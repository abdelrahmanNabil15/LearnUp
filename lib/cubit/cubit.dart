// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/state.dart';
import 'package:untitled2/model/RoomsJoined.dart';
import 'package:untitled2/modules/Profile/profile_screen.dart';
import 'package:untitled2/modules/home/home_screen.dart';
import 'package:untitled2/modules/notification/notification_screen.dart';

import '../network/CacheHelper.dart';
import '../network/DioHelper.dart';
import '../network/end_pionts.dart';

class learnUpCuibit extends Cubit<learnUpStates> {
  learnUpCuibit() : super(learnUpInitStates());

  static learnUpCuibit get(context) => BlocProvider.of(context);
  RoombyId? roombyId;
  dynamic token = CacheHelper.getData(key: 'result');

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "home ",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: "noitfication ",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile ",
    )
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(learnUpBottomNavInitStates());
  }

  List<Widget> Screen = [
    const HomeScreen(),
    const notification_screen(),
    const profile_screen()
  ];
  List<dynamic> business = [];

  Widget? getFAB() {
    if (Screen[currentIndex] == 0) {
      return const FloatingActionButton(
          backgroundColor: Colors.cyan,
          child: Icon(Icons.add),
          onPressed: null);
    } else {
      return FloatingActionButton(
          backgroundColor: Colors.deepOrange[800],
          child: const Icon(Icons.shopping_cart),
          onPressed: null);
    }
  }

  void startTimer(double _progress) {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => (() {
        if (_progress == 1) {
          timer.cancel();
        } else {
          _progress += 0.2;
        }
      }),
    );
  }

  void GetRoombyId() {
    emit(RoomsloadingsStates());
    DioHelper.getData(url: ROOMbyId, token: token).then((value) {
      roombyId = RoombyId.fromJson(value.data);
      print(roombyId?.messageCode);
      print(roombyId?.result?.name);
      print(token);
      emit(RoomsSuccessStates());
    }).catchError((error) {
      print(roombyId?.result?.name);
      print('Error sending request!');
      print(error);

      print(token);
      emit(RoomsErrorStates(roombyId!));
      {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(error.message);

        emit(RoomsErrorStates(roombyId!));
      }
    });
  }
}