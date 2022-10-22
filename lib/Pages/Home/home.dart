import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_scroll.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fit App')),
      // backgroundColor: Color(Colors.grey[900]),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: HomeScroll(),
          )),
        ],
      ),
    );
  }
}
