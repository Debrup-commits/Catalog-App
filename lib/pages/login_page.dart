// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool buttonChange=false;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  moveToHome(BuildContext context) async {

    if(_formKey.currentState!=null && _formKey.currentState!.validate()){
      setState(() {
        buttonChange=true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        buttonChange=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Column(
            children: [
        
              SizedBox(
                height: 20.0,
              ),
        
              Image.asset(
                "assets/images/login_image_2.png",
                height: 200,
                width: 200,
                ),
              
              SizedBox(
                height: 20.0,
              ),
              
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(
                height: 20.0,
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username", 
                      ),
                      validator: (String? value){
                        if(value==null || value.trim().length==0){
                          return "Username cannot be empty";
                        }

                        return null;
                      },
                    ),
              
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password", 
                      ),

                      validator: (String? value) {
                        if(value==null){
                          return "Password cannot be empty";
                        }
                        else if(value.length<6){
                          return "Password must have atleast 6 characters";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              
              SizedBox(
                height: 20.0,
              ),
        
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(buttonChange ? 50:8),
        
                child: InkWell(
                  onTap: ()=>moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: buttonChange ? 50 : 100,
                    height: 50,
                    alignment: Alignment.center,
                    child: buttonChange ? Icon(
                      Icons.done,
                      color: Colors.white,
                      ) : Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
  }
}