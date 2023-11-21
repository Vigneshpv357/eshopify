import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _fnameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _CpasswordController = TextEditingController();

  final _pNumbrController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://images.pexels.com/photos/2340254/pexels-photo-2340254.jpeg?auto=compress&cs=tinysrgb&w=1600"),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90,),
                  Text("SignUp",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,
                      shadows:[Shadow(
                        blurRadius: 10.0,
                        color: Colors.grey,
                        offset: Offset(5, 5),
                      ),]
                  ),),
                  SizedBox(height: 25,),
                  //Full Name
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _fnameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black45,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: Colors.yellow[700])
                    ),
                    validator: (namee){
                      if(namee!.isEmpty || namee==null){
                        return "Field cant be empty";
                      }
                    },
                  ),
                  SizedBox(height: 25,),
                  //Username
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black45,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        labelText: "Username or emai id",

                        labelStyle: TextStyle(color: Colors.yellow[700])
                    ),
                    validator: (email){
                      if(email!.isEmpty|| email==null){
                        return "Field can't be empty";
                      }
                      else if(!email.isEmailValid()){
                        return "Please enter a valid email ID";
                      }

                    },
                  ),
                  SizedBox(height: 28,),
                  //Phone Number
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    controller: _pNumbrController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black45,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        labelText: "Phone Number",
                        labelStyle: TextStyle(color: Colors.yellow[700])
                    ),
                    validator: (number){
                      if(number!.isEmpty || number==null){
                        return "Field cant be empty";
                      } else if(isNumberValid(number)){

                      }
                    },
                  ),
                  SizedBox(height: 28,),
                  //Password
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    controller: _passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black45,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.yellow[700])

                    ),
                    validator: (paswd){
                      if(paswd!.isEmpty || paswd==null){
                        return "Field can't be empty";
                      }
                      else if(isPasswordValid(paswd)==false){
                        return "Please enter a valid password";
                      }
                    },
                  ),
                  SizedBox(height: 28,),
                  //Confirm Password
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    controller: _CpasswordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black45,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.yellow[700])

                    ),
                    validator: (paswd){
                      if(paswd!.isEmpty || paswd==null){
                        return "Field can't be empty";
                      }
                      else if(isPasswordValid(paswd)==false){
                        return "Please enter a valid password";
                      }
                    },
                  ),
                  SizedBox(height: 28,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(onPressed: (){
                        Navigator.pop(context);
                      },
                          child: Text("Cancel",style: TextStyle(color: Colors.yellow[700]),)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow[700]
                          ),
                          onPressed: (){
                            checkLogin(context);
                          },
                          child: Text("Submit",style: TextStyle(color: Colors.black),)),
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  void checkLogin(BuildContext ctx) async{
    if(_formKey.currentState!.validate())
    {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      //Goto Home

      // Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1) => HomePage()));

    }
  }
  bool isPasswordValid(String? passWord){
    if(passWord==null) return false;
    final regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(passWord);

  }
  bool isNumberValid(String? number){
    if(number==null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(number);
  }
}
extension SignupScreenState on String {
  bool isEmailValid(){
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
