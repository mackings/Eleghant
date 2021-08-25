import 'package:etest/login.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Mysignup extends StatefulWidget {
  const Mysignup({Key ?key}) : super(key: key);

  @override
  _MysignupState createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {

  //All Controllers

  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();

  //do registration
  void doUserRegistration() async {
    final conUsername = controllerUsername.text.trim();
    final conPassword = controllerEmail.text.trim();
    final conEmail = controllerPassword.text.trim();

    final user = ParseUser.createUser(conUsername, conEmail, conPassword);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }


  //sucess Message
    void showSuccess() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success!"),
            content: const Text("User was successfully created!"),
            actions: <Widget>[
              new MaterialButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }


    //failure Message
    void showError(String errorMessage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error!"),
            content: Text(errorMessage),
            actions: <Widget>[
              new MaterialButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Sign Up"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(

              children: [
                //conUsername
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllerUsername,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Enter Username",
                        hoverColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Username',
                      suffixIcon: Icon(Icons.person,color: Colors.black,),
                    ),
                  ),
                ),
                //conEmail
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Email",
                      hoverColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email,color: Colors.black,),
                    ),
                  ),
                ),

                //def e/pass
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controllerPassword,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: " Enter Password",
                      hoverColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black38),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.password,color: Colors.black,),

                    ),
                  ),
                ),

                //Sign up
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                      doUserRegistration();
                    },
                    child: Container(
                      height: 70,
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign Up",style:TextStyle( color: Colors.white,fontSize: 15.0),),
                          Icon(Icons.arrow_forward,color: Colors.white,),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                //sign in
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Mylogin()));
                    },
                    child: Container(
                      height: 70,
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign In",style:TextStyle( color: Colors.white,fontSize: 15.0),),
                          Icon(Icons.arrow_forward,color: Colors.white,),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        )
      ),
    );
  }
}
