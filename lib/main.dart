import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'lib/assets/translations',
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('en', 'US'),
      child: App(),
    ),
  );
}
