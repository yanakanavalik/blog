import 'package:blog/widgets/organisms/page_container/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogPage extends StatefulWidget {
  DogPage({Key? key}) : super(key: key);

  static String get path => '/doggy-bloggy';

  @override
  _DogPageState createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      pageTitle: 'Doggy bloggy',
      pageBody: Column(
        children: [
          Text('Articles'),
        ],
      ),
    );
  }
}
