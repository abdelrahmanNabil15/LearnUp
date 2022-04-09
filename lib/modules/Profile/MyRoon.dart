import 'package:flutter/material.dart';

import '../../commponet/Rooms.dart';

class MyRoom extends StatelessWidget {
  const MyRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Rooms(
            host: 'abdelrahman nabil',
            Roomdescription: "i thank you for tihs room im not 57at ya be",
            RoomName: "Gp team hbibpi ph ypyibh yv6yvy hutv t o yv6ygy ou yvf6yvou",
            Status: 'Joined',
          ),
        ),
      ),
    );
  }
}
