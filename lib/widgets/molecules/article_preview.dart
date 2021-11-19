import 'package:blog/common/style/font-styles.dart';
import 'package:blog/common/utils/screen.dart';
import 'package:blog/core/entities/article_summary.dart';
import 'package:blog/widgets/atoms/tappable_container.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';

class ArticlePreview extends StatelessWidget {
  ArticlePreview({
    required this.articleSummary,
  });

  final ArticleSummary articleSummary;

  @override
  Widget build(BuildContext context) {
    return TappableContainer(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 55.0),
      margin: EdgeInsets.only(
        right: getScreenWidth(context: context) / 4,
        left: 16.0,
        bottom: 16.0,
        top: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articleSummary.title,
            style: titleST,
          ),
          const SizedBox(height: 1.0),
          Text(
            'Date: ${DateFormat('MM-dd-yyyy').format(DateTime.parse(articleSummary.dateCreated))}',
            style: paragraphST,
          ),
          if (articleSummary.summary.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(
                articleSummary.summary,
                style: paragraphST,
              ),
            )
        ],
      ),
      onTap: () => Navigator.pushNamed(
        context,
        '/article/${articleSummary.id}',
        arguments: articleSummary.id,
      ),
    );
  }
}
