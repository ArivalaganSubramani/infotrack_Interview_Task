import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infotrack_interview_task/models/user_Model.dart';
import 'dashboard_Screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Future<Login?> _userData;

  Future<Login?> userData() async {
    if (_formKey.currentState!.validate()) {
      String identity = _usernameController.text;
      String password = _passwordController.text;
      final response = await http.post(
        Uri.parse(
            'https://vtsnmscheck.infotracktelematics.com/nms_api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "identity": identity,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 CREATED response,
        // then parse the JSON.
        final re = jsonDecode(response.body);

        debugPrint("json decode resp $re");

        if (re["status"] == 200) {
          Navigator.pushReplacement(

            context,
            MaterialPageRoute(
              builder: (context) =>
                  DashboardScreen(role_id: re["roleId"],
                      user_id: re["userid"],
                      token: re["token"]),

            ),
         );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successful!'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.blue,// Adjust the duration as needed
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid username or password"),
              backgroundColor: Colors.red,
            ),
          );
        }
      }

      return Login.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }

    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 250,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 28), // Add some space between title and subtitle
              Text(
                "Welcome back",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Please enter your details to sign in",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child:TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                      border: InputBorder.none,
                      icon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a username";
                      }
                      return null;
                    },
                  ),
              ),
                  const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child:TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      }
                      return null;
                    },
                  ),
            ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed:(){
                    setState(() {
                      _userData = userData();
                      });
                    } ,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

