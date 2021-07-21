import 'package:blog/common/style/colors.dart';
import 'package:blog/common/utils/screen.dart';

import 'package:blog/widgets/organisms/menu/menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

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
        title: Text('notFoundPage.title').tr(),
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
                  Text('notFoundPage.description').tr(),
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
