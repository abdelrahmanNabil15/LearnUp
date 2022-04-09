// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/commponet/DefaultFormField.dart';
import 'package:untitled2/commponet/defult_button.dart';
import 'package:untitled2/modules/login/Loginscreen.dart';

import '../../commponet/customdatefield.dart';
import '../../home_Layout.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var detaController = TextEditingController();
  var PasswordController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.isSuccess) {
              Fluttertoast.showToast(
                  msg: state.registerModel.messageCode,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: state.registerModel.messageCode,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  fontSize: 16.0);
            }
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeLayout()),
                (Route<dynamic> route) => false);
          }
            }, builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(200),
                            topLeft: Radius.circular(200))),
                          ),
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 7, top: 25),
                      child: Text(
                        "  Welcome",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.cyan),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 15),
                  child: Text(
                    "  Sign Up to Continue",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: DefaultFormField(
                            isobscureText: false,
                    controller: nameController,
                    inputAction: TextInputAction.next,
                    label: 'UserName',
                    prefix: Icons.person,
                    type: TextInputType.name,
                    validator: (String value) {
                      if (value.isEmpty) {
                        print("please enter username ");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                    )),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: DefaultFormField(
                    isobscureText: false,
                    controller: phoneController,
                    inputAction: TextInputAction.next,
                    label: 'phone',
                    prefix: Icons.phone,
                    type: TextInputType.phone,
                    validator: (String value) {
                      if (value.isEmpty) {
                        print("please enter phone ");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: CustomdateField(
                      dateController: detaController,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: DefaultFormField(
                    isobscureText: true,
                    controller: PasswordController,
                    inputAction: TextInputAction.done,
                    label: 'Password',
                    prefix: Icons.lock,
                    type: TextInputType.visiblePassword,
                    validator: (String value) {
                      if (value.isEmpty) {
                        print("please enter password");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (state is! RegisterLoadingState)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.cyan,
                      child: DefaultButton(
                        function: () {
                          RegisterCubit.get(context).userregister(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                            password: PasswordController.text,
                            date: detaController.text,
                          );
                        },
                        text: 'SIGN IN',
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                if (state is RegisterLoadingState)
                  const Center(child: CircularProgressIndicator()),
                const SizedBox(
                  height: 20.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'I have an account?',
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                            ]),
                      ])));
        }));
  }
}
