import 'package:blog/common/style/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotFoundPage extends StatefulWidget {
  NotFoundPage({Key? key}) : super(key: key);

  static String get path => '/not-found';

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page not Found'),
        backgroundColor: copperCrayolaColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text('Page not found. Please, try again.'),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
