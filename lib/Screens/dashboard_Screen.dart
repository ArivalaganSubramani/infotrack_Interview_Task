import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:infotrack_interview_task/models/dashboard_Model.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  final String role_id;
  final String user_id;
  late String token;

  DashboardScreen({ required this.role_id,required this.user_id,required this.token}) : super();

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();

}
class _DashboardScreenState extends State<DashboardScreen> {


  Future<void> fetchUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //return Albu.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
    getPosts(widget.token);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Text("DashBoard"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("vesselCnt"),
                    SizedBox(height: 15),
                    Text("121",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("boatownrCnt"),
                SizedBox(height: 15),
                Text("206",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("alertCnt"),
                SizedBox(height: 15),
                Text("6045",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("userCnt"),
                SizedBox(height: 25),
                Text("250",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("crewCnt"),
                SizedBox(height: 25),
                Text("278",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 10),
                Text("geoboundary AlertCnt"),
                SizedBox(height: 10),
                Text("49",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("infoAlertCnt"),
                SizedBox(height: 15),
                Text("84",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("status"),
                SizedBox(height: 15),
                Text("200",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Column(
              children: [
                SizedBox(height: 15),
                Text("message"),
                SizedBox(height: 15),
                Text("Valid token",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],

            ),
          ),
        ],
      )
    );
  }



  // final response = await http.get(url, headers: {
  // 'Content-Type': 'application/json',
  // 'Accept': 'application/json',
  // 'Authorization': 'Bearer $token',
  // });

  // final String postsURL = "https://vtsnmscheck.infotracktelematics.com/nms_api/auth/GetAdminDashboardCount?m=true&role_id=1&user_id=14";
  //
  // Future<List<Dashboard>> getPosts() async {
  // Response res = await http.get(Uri.parse(postsURL), headers: {
  //
  // 'Content-Type': 'application/json',
  //  'Accept': 'application/json',
  // 'Authorization': 'Bearer $token',
  //  }
  // );
  //
  // if (res.statusCode == 200) {
  // List<dynamic> body = jsonDecode(res.body);
  //
  // List<Dashboard> posts = body.map((dynamic item) => Dashboard.fromJson(item),).toList();
  //
  // return posts;
  // } else {
  // throw "Unable to retrieve posts.";
  //   }
  // }




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  /*Future<List<Dashboard>> getPosts(String token) async {


    // request.body = '''''';

    const String postsURL = "https://vtsnmscheck.infotracktelematics.com/nms_api/auth/GetAdminDashboardCount?m=true&role_id=1&user_id=14";
    // request.headers.addAll(headers);
    // Future<List<Dashboard>> getPosts(token) async {
      debugPrint("token $token");
      Map<String, String> header = {
    'Content-Type':'application/json',
    'Authorization':'Bearer $token',
    };
      Response res = await http.get(Uri.parse(postsURL), headers: header
      );
      List<Dashboard> posts=[];
      try{
        debugPrint("res.statusCode $res");
        debugPrint("res.statusCode ${res.statusCode}");
        if (res.statusCode == 200) {
          debugPrint("success body ${res.body}");
          List<dynamic> body = jsonDecode(res.body);

          posts = body.map((dynamic item) => Dashboard.fromJson(item),).toList();

          return posts;
        }else{
          debugPrint(res.body);
          debugPrint(res.headers.toString());
        }
      } catch(e) {
        print(e);
        throw "Unable to retrieve posts.";
      }
      return posts;
    }
*/
  Future<List<Dashboard>> getPosts(String token) async {
    const String postsURL =
        "https://vtsnmscheck.infotracktelematics.com/nms_api/auth/GetAdminDashboardCount?m=true&role_id=1&user_id=14";

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(Uri.parse(postsURL), headers: headers);
      debugPrint("res.statusCode $response");
      debugPrint("res.statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> data = jsonDecode(response.body);
        List<Dashboard> posts = [];
        return posts;
        /*if (data.containsKey('yourListKey')) {
          List<dynamic> body = data['yourListKey'];
          List<Dashboard> posts =
          body.map((dynamic item) => Dashboard.fromJson(item)).toList();

          return posts;
        } else {
          // Handle the case where the expected list key is not found
          throw "List key not found in the response.";
        }*/
      } else {
        // Handle non-200 status codes
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw "Failed to fetch posts. Status code: ${response.statusCode}";
      }
    } catch (e) {
      // Handle general errors
      print("Error: $e");
      throw "Unable to retrieve posts.";
    }
  }
  // }
}