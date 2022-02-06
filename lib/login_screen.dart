import 'package:assignment_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'controllers/CommonController.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _key = GlobalKey();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c252c),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: GetBuilder<LoginFormController>(
          init: LoginFormController(),
          builder:(controller)=> Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/game.tv-logo.png"),
              Divider(
                color: Colors.transparent,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    hintText: "Enter Username"),
                onChanged: (val){
                  print(controller.isNameValidate);
                  controller.setUserName(val);
                },
                validator: (val) => controller.nameError,
              ),
              Divider(
                color: Colors.transparent,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    hintText: "Enter Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.visibility_off_outlined))),
                obscureText: isVisible,
                onChanged: (val){
                  controller.setPassword(val);
                },
                validator: (val) => controller.passwordError,
              ),
              Divider(
                color: Colors.transparent,
                height: 20,
              ),
              ElevatedButton(
                onPressed: controller.isNameValidate && controller.isPasswordValidate ? () {
                  controller.loginUser(controller.userName, controller.password);
                } : null,
                child: Text("SUBMIT"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
