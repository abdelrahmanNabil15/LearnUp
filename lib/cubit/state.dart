// ignore_for_file: camel_case_types

import '../model/RoomsJoined.dart';

abstract class learnUpStates {}

class learnUpInitStates extends learnUpStates {}

class learnUpBottomNavInitStates extends learnUpStates {}

class learnUploadingsStates extends learnUpStates {}

class learnUpsuccessStates extends learnUpStates {}

class RoomsInitStates extends learnUpStates {}

class RoomsloadingsStates extends learnUpStates {}

class RoomsSuccessStates extends learnUpStates {}

class RoomsErrorStates extends learnUpStates {
  late RoombyId roombyId;

  RoomsErrorStates(this.roombyId);
}

class learnUpErrorStates extends learnUpStates {
  late final String error;

  learnUpErrorStates(this.error);
}
