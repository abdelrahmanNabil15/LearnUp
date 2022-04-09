import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/commponet/CustomText.dart';

import '../../commponet/defult_button.dart';
import '../../cubit/cubit.dart';
import '../../cubit/state.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => learnUpCuibit()..GetRoombyId(),
        child: BlocConsumer<learnUpCuibit, learnUpStates>(
            listener: (context, state) {},
            builder: (context, Object? state) {
              var cubit = learnUpCuibit.get(context);
              return ConditionalBuilder(
                condition: cubit.roombyId != null,
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: customText(
                          text: cubit.roombyId!.result!.name,
                          fontWeight: FontWeight.bold,
                          maxline: 1,
                          fontSize: 20),
                    ),
                    body: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            color: Colors.cyan,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          maxline: 1,
                                          fontWeight: FontWeight.bold,
                                          text:
                                              cubit.roombyId!.result!.ownerName,
                                          alignment: Alignment.topLeft,
                                          color: Colors.white,
                                        ),
                                        customText(
                                          maxline: 1,
                                          fontWeight: FontWeight.normal,
                                          text: cubit
                                              .roombyId!.result!.description,
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    DefaultButton(
                                      text: "Join",
                                      color: Colors.transparent,
                                      width: 70,
                                      function: () {},
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: customText(
                            fontSize: 12,
                            maxline: 3,
                            fontWeight: FontWeight.normal,
                            text: " this room started at " +
                                cubit.roombyId!.result!.startDate +
                                " and will end in " +
                                cubit.roombyId!.result!.expectedEndDate +
                                " we thank you to joined with us",
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                fallback: (BuildContext context) => Container(
                    color: Colors.white,
                    child: const Center(child: CircularProgressIndicator())),
              );
            }));
  }
}
