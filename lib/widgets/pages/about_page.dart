import 'package:blog/common/style/colors.dart';
import 'package:blog/common/utils/screen.dart';

import 'package:blog/widgets/organisms/menu/menu.dart';
import 'package:blog/widgets/organisms/page_container/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  static String get path => '/about-author';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      pageTitle: 'aboutAuthorPage.title'.tr(),
      pageBody: Column(
        children: [
          Text(''),
          const SizedBox(height: 16.0),
          Text('Photo part'),
          const SizedBox(height: 16.0),
          Text('Description about experience'),
          const SizedBox(height: 16.0),
          Text('Block with social networks'),
        ],
      ),
    );
  }
}
