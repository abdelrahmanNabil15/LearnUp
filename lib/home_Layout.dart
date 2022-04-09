// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubit/state.dart';

import 'cubit/cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => learnUpCuibit(),
      child: BlocConsumer<learnUpCuibit, learnUpStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = learnUpCuibit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text(" LEARN UP "),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
              body: cubit.Screen[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItem,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            );
          }),
    );
  }
}
