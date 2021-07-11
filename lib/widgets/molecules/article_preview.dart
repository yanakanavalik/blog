import 'package:blog/common/style/colors.dart';
import 'package:blog/common/utils/screen.dart';
import 'package:blog/widgets/atoms/tappable_container.dart';
import 'package:flutter/widgets.dart';

class ArticlePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TappableContainer(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 55.0),
      width: getScreenWidth(context: context) / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title of article',
            style: TextStyle(color: peachColor, fontWeight: FontWeight.bold),
          ),
          Text(
            'Date when was written',
            style: TextStyle(color: darkJungleGreenColor),
          ),
          Text(
            'Summary',
            style: TextStyle(color: darkJungleGreenColor),
          ),
        ],
      ),
    );
  }
}
