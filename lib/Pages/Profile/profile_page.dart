import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            child: Image.asset('assets/images/avatar.png'),
            radius: 60,
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mohammad Qaddumi'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('mohammad.j.qaddumi@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('970569971679'),
          )
        ],
      ),
    );
  }
}
