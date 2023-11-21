import 'package:eshopify/module/Forgot%20Password/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../Home/view/home_view.dart';
import '../Signup/signup.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible=false;
  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://images.pexels.com/photos/2340254/pexels-photo-2340254.jpeg?auto=compress&cs=tinysrgb&w=1600"),
              fit: BoxFit.cover),
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
                  SizedBox(height: 120,),
                  Text("Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,shadows:[
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.grey,
                      offset: Offset(5, 5),
                    ),
                    // font size and color of the text
                  ] ),),
                  SizedBox(height: 45,),
                  Text("LogIn for\nBest Shopping Experience...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,shadows:[
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.grey[400]!,
                      offset: Offset(5, 5),
                    ),
                    // font size and color of the text
                  ]),),
                  SizedBox(height: 35,),
                  //Username
                  TextFormField(
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black45,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      hintText: "Ussername",
                    ),
                    validator: (usernamee){
                      if(usernamee!.isEmpty || usernamee==null){
                        return "Field cant be empty";
                      }
                    },
                  ),
                  SizedBox(height: 38,),
                  //Password
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: passwordVisible,
                    controller: _passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon((passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),color: Colors.white,),
                        onPressed: () {
                          setState(
                                () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },

                      ),

                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black45,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      hintText: "Password",
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
                  SizedBox(height: 48,),
                  Center(child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPage()));
                  }, child: Text("Forgot Password?",style: TextStyle(color: Colors.white),))),
                  Center(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700]
                      ),
                      onPressed: (){
                        checkLogin(context);
                      },
                      child: Text("Login",style: TextStyle(color: Colors.black),))),
                  SizedBox(height: 20,),
                  Center(child: Text("Not a Member",style: TextStyle(color: Colors.white),)),
                  SizedBox(height: 8,),
                  Center(child: OutlinedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                  },
                      child: Text("SignUp",style: TextStyle(color: Colors.yellow[700]),))),

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  void checkLogin(BuildContext ctx) async{
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if(_formKey.currentState!.validate())
    {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      //Goto Home
      _sharedPrefs.setString("username", _usernameController.text);
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeView()));

    }else{

    }
  }
  bool isPasswordValid(String? passWord){
    if(passWord==null) return false;
    final regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(passWord);

  }
}
