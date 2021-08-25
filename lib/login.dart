import 'package:etest/enjoy.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key ?key}) : super(key: key);

  @override
  _MyloginState createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;

  //userlogin

  void doUserLogin() async {
    final username = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> daenjoy()));
      showSuccess("User was successfully login!");
      setState(() {
        isLoggedIn = true;
      });
    } else {
      showError(response.error!.message);
    }
  }
//logout user
  void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (response.success) {
      showSuccess("User was successfully logout!");
      setState(() {
        isLoggedIn = false;
      });
    } else {
      showError(response.error!.message);
    }
  }

  //show success
  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
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

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Login"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
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

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    doUserLogin();
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
        )






      ),
    );
  }
}
