import 'package:blog/widgets/pages/article_page/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/pages/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog by Yana Kanavalik',
      theme: ThemeData(
        //primarySwatch: copperCrayolaColor,
        backgroundColor: Colors.white,
      ),
      initialRoute: HomePage.path,
      routes: {
        HomePage.path: (context) => HomePage(),
        AboutAuthorPage.path: (context) => AboutAuthorPage(),
        NotFoundPage.path: (context) => NotFoundPage(),
        DogPage.path: (context) => DogPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.path) {
          return MaterialPageRoute(builder: (context) => HomePage());
        } else if (settings.name == AboutAuthorPage.path) {
          return MaterialPageRoute(builder: (context) => AboutAuthorPage());
        } else if (settings.name == DogPage.path) {
          return MaterialPageRoute(builder: (context) => DogPage());
        }

        var uri = Uri.parse(settings.name ?? '');
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'article') {
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
