import 'package:flutter/material.dart';

import '../../commponet/commpnet.dart';

class JoinedRooms extends StatelessWidget {
  const JoinedRooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Rooms(),
        ),
      ),
    );
  }
}
