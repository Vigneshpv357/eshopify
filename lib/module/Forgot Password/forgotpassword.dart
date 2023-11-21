import 'package:flutter/material.dart';
class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _emailforgotController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
      ),
      body: Form(

        child: Container(

          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(

              image:  DecorationImage(
                image:  NetworkImage("https://images.pexels.com/photos/3728311/pexels-photo-3728311.jpeg"),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Verify Your Email ID",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFormField(
                    controller: _emailforgotController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black45,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      hintText: "Enter your email id",
                    ),
                    validator: (usernamee){
                      if(usernamee!.isEmpty || usernamee==null){
                        return "Field cant be empty";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 260,top: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black
                      ),
                      onPressed: (){

                      },
                      child: Text("Submit",style: TextStyle(color: Colors.yellow[700]),)),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }



}
