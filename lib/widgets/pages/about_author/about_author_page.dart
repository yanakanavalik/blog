import 'package:blog/widgets/organisms/page_container/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutAuthorPage extends StatefulWidget {
  AboutAuthorPage({Key? key}) : super(key: key);

  static String get path => '/about-author';

  @override
  _AboutAuthorPageState createState() => _AboutAuthorPageState();
}

class _AboutAuthorPageState extends State<AboutAuthorPage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      pageTitle: 'About author',
      pageBody: Column(
        children: [
          Text(''),
          const SizedBox(height: 16.0),
          Text(
            'Photo part',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Description about experience',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Block with social networks',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
