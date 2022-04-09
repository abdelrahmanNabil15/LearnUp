import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled2/commponet/CustomText.dart';

import '../../commponet/DefaultFormField.dart';
import '../../commponet/customdatefield.dart';
import '../../commponet/defult_button.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Profile extends StatelessWidget {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var detaController = TextEditingController();
  var phoneController = TextEditingController();

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => UserDataCubit()..GetUserdata(),
        child: BlocConsumer<UserDataCubit, UserDataStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                condition: UserDataCubit.get(context).usermodel != null,
                builder: (context) {
                  var cubit = UserDataCubit.get(context);

                  nameController.text = cubit.usermodel!.result!.name.isNotEmpty
                      ? cubit.usermodel!.result!.name
                      : "not data";
                  phoneController.text =
                      cubit.usermodel!.result!.phoneNumber.isNotEmpty
                          ? cubit.usermodel!.result!.phoneNumber
                          : "no data";

                  detaController.text =
                      cubit.usermodel!.result!.birthdate.isNotEmpty
                          ? cubit.usermodel!.result!.birthdate
                          : "no data";
                  emailController.text =
                      cubit.usermodel!.result!.userName.isNotEmpty
                          ? cubit.usermodel!.result!.userName
                          : "no data";

                  return Scaffold(
                      appBar: AppBar(),
                      body: cubit.usermodel == null
                          ? Container(
                              color: Colors.white,
                              child: const Center(
                                  child: CircularProgressIndicator()))
                          : SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      child: pic()),
                                  //name of User
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 25.0, top: 25.0),
                                    child: customText(
                                      maxline: 1,
                                      fontWeight: FontWeight.bold,
                                      text: 'Your name ',
                                      alignment: Alignment.centerLeft,
                                      fontSize: 15,
                                    ),
                                  ),
                                  //name of User in fieldForm
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 7.0),
                                    child: DefaultFormField(
                                      isobscureText: false,
                                      controller: nameController,
                                      inputAction: TextInputAction.next,
                                      label: 'Name',
                                      prefix: Icons.person,
                                      type: TextInputType.name,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          print("please enter email ");
                                        }
                                      },
                                    ),
                                  ),
                                  //Email of user
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 25.0, top: 7.0),
                                    child: customText(
                                      maxline: 1,
                                      fontWeight: FontWeight.bold,
                                      text: 'Your Email ',
                                      alignment: Alignment.centerLeft,
                                      fontSize: 15,
                                    ),
                                  ),
                                  //email of user in fieldForm
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 7.0),
                                    child: DefaultFormField(
                                      isobscureText: false,
                                      controller: emailController,
                                      inputAction: TextInputAction.next,
                                      label: 'Email Address',
                                      prefix: Icons.email,
                                      type: TextInputType.emailAddress,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          print("please enter email ");
                                        }
                                      },
                                    ),
                                  ),
                                  //Date of Birth
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 25.0, top: 7.0),
                                    child: customText(
                                      maxline: 1,
                                      fontWeight: FontWeight.bold,
                                      text: ' Date of Birth',
                                      alignment: Alignment.centerLeft,
                                      fontSize: 15,
                                    ),
                                  ),
                                  //date of Birth
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 7.0),
                                    child: CustomdateField(
                                      dateController: detaController,
                                    ),
                                  ),
                                  //phone number
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 25.0, top: 7.0),
                                    child: customText(
                                      maxline: 1,
                                      fontWeight: FontWeight.bold,
                                      text: 'Phone Number ',
                                      alignment: Alignment.centerLeft,
                                      fontSize: 15,
                                    ),
                                  ),
                                  //phone number
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 7.0),
                                    child: DefaultFormField(
                                      isobscureText: false,
                                      controller: phoneController,
                                      inputAction: TextInputAction.next,
                                      label: 'Phone Number',
                                      prefix: Icons.person,
                                      type: TextInputType.phone,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          print("please enter phone ");
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: DefaultButton(
                                      text: "Update",
                                      function: () {},
                                      color: Colors.cyan,
                                      width: double.infinity,
                                    ),
                                  )
                                ],
                              ),
                            ));
                },
                fallback: (BuildContext context) => Container(
                    color: Colors.white,
                    child: const Center(child: CircularProgressIndicator())),
              );
            }));
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
