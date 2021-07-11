import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

import 'common/style/colors.dart';
import 'widgets/pages/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'header.title'.tr(),
      theme: ThemeData(primarySwatch: copperCrayolaColor),
      home: HomePage(),
    );
  }
}
