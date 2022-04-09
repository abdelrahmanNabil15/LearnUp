import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled2/commponet/CustomText.dart';
import 'package:untitled2/commponet/commpnet.dart';
import 'package:untitled2/cubit/cubit.dart';
import 'package:untitled2/cubit/state.dart';
import 'package:untitled2/modules/Rooms/RoomsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => learnUpCuibit()..GetRoombyId(),
      child: BlocConsumer<learnUpCuibit, learnUpStates>(
        listener: (context, state) {},
        builder: (context, Object? state) {
          var cubit = learnUpCuibit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                condition: state is! learnUploadingsStates,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///category widget
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const customText(
                            fontWeight: FontWeight.bold,
                            maxline: 1,
                            fontSize: 20,
                            text: 'Category',
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: const customText(
                              fontWeight: FontWeight.bold,
                              maxline: 1,
                              text: 'More...',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Cateogery(),

                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const customText(
                                  fontWeight: FontWeight.bold,
                                  maxline: 1,
                                  fontSize: 20,
                                  text: 'List of Instructor',
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  child: const customText(
                                    fontWeight: FontWeight.bold,
                                    maxline: 1,
                                    text: 'More...',
                                  ),
                                ),
                              ],
                            ),
                            ListOfinstructor(),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const customText(
                                  fontWeight: FontWeight.bold,
                                  maxline: 1,
                                  fontSize: 20,
                                  text: 'Rooms',
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    cubit.GetRoombyId();
                                  },
                                  child: const customText(
                                    fontWeight: FontWeight.bold,
                                    maxline: 1,
                                    text: 'More...',
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RoomsScreen()));
                                },
                                child: Rooms()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.GetRoombyId();
                showMaterialModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.white,
                  builder: (context) => const SizedBox(
                    height: 300,
                    width: double.infinity,
                  ),
                );
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
