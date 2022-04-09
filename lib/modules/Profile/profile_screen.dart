// ignore_for_file: camel_case_types

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled2/commponet/ProfileMenu.dart';
import 'package:untitled2/modules/Profile/cubit/state.dart';
import 'package:untitled2/modules/Profile/profile.dart';

import 'MyRoon.dart';
import 'cubit/cubit.dart';
import 'joinedRooms.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => UserDataCubit()..GetUserdata(),
        child: BlocConsumer<UserDataCubit, UserDataStates>(
            listener: (context, state) {},
            builder: (context, state) => ConditionalBuilder(
                  condition: true,
                  builder: (context) => Scaffold(
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(alignment: Alignment.center, child: pic()),
                          profileMeun(
                            text: "My Account",
                            icon: "assets/User Icon.svg",
                            press: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              )
                            },
                          ),
                          profileMeun(
                            text: "My Rooms",
                            icon: "assets/myspace (2).svg",
                            press: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => MyRoom()),
                              )
                            },
                          ),
                          profileMeun(
                            text: "Joined Rooms",
                            icon: "assets/myspace.svg",
                            press: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => JoinedRooms()),
                              )
                            },
                          ),
                          profileMeun(
                            text: "Timeline",
                            icon: "assets/myspace.svg",
                            press: () => {},
                          ),
                          profileMeun(
                            color: Colors.redAccent,
                            text: "Logout",
                            icon: "assets/logout-svgrepo-com.svg",
                            press: () =>
                                {UserDataCubit.get(context).SignOut(context)},
                          ),
                        ],
                      ),
                    ),
                  ),
                  fallback: (BuildContext context) => Container(
                      color: Colors.white,
                      child: const Center(child: CircularProgressIndicator())),
                )));
  }

  Widget pic() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/Profile Image.png"),
          ),
          Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                  height: 46,
                  width: 46,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Colors.grey)),
                      primary: Colors.grey,
                    ),
                    onPressed: () {},
                    child: SvgPicture.asset("assets/Camera Icon.svg"),
                  )))
        ],
      ),
    );
  }
}
