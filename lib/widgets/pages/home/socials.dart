import 'package:blog/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Socials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createButton(
            label: 'Instagram',
            launchUrl: 'https://www.instagram.com/yanakanavalik/?hl=en',
          ),
          _createButton(
            label: 'Linkedin',
            launchUrl: 'https://www.linkedin.com/in/yana-kanavalik/',
          ),
          _createButton(
            label: 'Github',
            launchUrl: 'https://github.com/yanakanavalik',
          ),
          _createButton(
            label: 'Facebook',
            launchUrl: 'https://www.facebook.com/yana.kanavalik',
          ),
        ],
      ),
    );
  }

  Widget _createButton({String label = "", String launchUrl = ""}) {
    return new TextButton(
      child: new Text(label),
      onPressed: () => launch(launchUrl),
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return charlestonGreenColor;
            }
            return tumbleweedColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            return Colors.white;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            return Colors.white;
          },
        ),
      ),
    );
  }
}
