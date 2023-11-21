import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../Login/login.dart';
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    checkUserLoggedIn();
    gotoLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(

            image:  DecorationImage(
              image:  NetworkImage("https://images.pexels.com/photos/3728311/pexels-photo-3728311.jpeg?auto=compress&cs=tinysrgb&w=1600"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",height: 150,),
            SizedBox(height: 10,),
            const Text("E Shoppy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.orange,
                offset: Offset(5, 5),
              ),
            ]),),
            SizedBox(height: 50,),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future<void> gotoLogin() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> LoginPage()));
  }
  Future<void> checkUserLoggedIn() async{
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if(_userLoggedIn == null || _userLoggedIn==false){
      gotoLogin();
    }else{
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));
    }
  }
}
