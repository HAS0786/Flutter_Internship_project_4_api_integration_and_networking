import 'package:api_integration_and_networking/models/userdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Userprofile extends StatelessWidget {
  final UserData userdetail; // make an object of UserData class (as now this contain Dart form data of users)
  const Userprofile({super.key, required this.userdetail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Username: ${userdetail.username}"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                  "https://avatar.iran.liara.run/public/boy?username=[${userdetail.id}]",
                ),
                onBackgroundImageError: (_,_){

                },
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Text(userdetail.name,style: TextStyle(fontSize: 32),),
              Text(userdetail.email ?? "No Email"),
            ],
          ),
        ),

    ));
  }
}
