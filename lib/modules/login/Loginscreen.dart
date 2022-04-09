// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/commponet/DefaultFormField.dart';
import 'package:untitled2/commponet/defult_button.dart';
import 'package:untitled2/modules/Register/RegisterScreen.dart';

import '../../home_Layout.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var PasswordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
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
        },
        builder: (context, state) {
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
                        "  Welcome,",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                            SizedBox(
                      height: 22,
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
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
                    "  Sign in to Continue,",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0),
                          child: DefaultFormField(
                            isobscureText: false,
                            controller: emailController,
                            inputAction:TextInputAction.next,
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


                        const SizedBox(
                  height: 20,
                ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0),
                          child: DefaultFormField(
                            controller: PasswordController,
                            isobscureText: true,

                            type: TextInputType.emailAddress,
                            prefix:  Icons.lock ,
                            label: "Password",
                             inputAction: TextInputAction.done,
                            validator: (String value){
                              if (value.isEmpty){
                                print('pelease enter your password ');
          }

          },



                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                              alignment: Alignment.bottomRight,
                              child: MaterialButton(
                                onPressed: () {},
                        child: const Text('Forgot Password?'),
                      )),
                        ),
                        const SizedBox(
                  height: 5,
                ),
                        if (state is! LoginLoadingState)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0),
                            child: DefaultButton(
                              function: () {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: PasswordController.text,
                                );
                      },
                      text: 'SIGN IN',
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                if (state is LoginLoadingState)
                  const Center(child: CircularProgressIndicator()),
                const SizedBox(
                  height: 20.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Don\'t have an account?',
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) =>
                                          RegisterScreen()), (Route<dynamic> route) => false);
                                },
                                child: const Text(
                      'REGISTER',
                    ),
                              ),
                            ]),

                      ])));
        },
      ),
    );
  }
}
