import 'package:blog/widgets/pages/article_page/index.dart';
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
      initialRoute: HomePage.path,
      routes: {
        HomePage.path: (context) => HomePage(),
        AboutPage.path: (context) => AboutPage(),
        NotFoundPage.path: (context) => NotFoundPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.path) {
          return MaterialPageRoute(builder: (context) => HomePage());
        } else if (settings.name == AboutPage.path) {
          return MaterialPageRoute(builder: (context) => AboutPage());
        }

        var uri = Uri.parse(settings.name ?? '');
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'article') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => ArticlePage(id: id),
          );
        }

        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
    );
  }
}
