import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleImageWidget extends StatelessWidget {
  const ArticleImageWidget({super.key, required this.articleImageUrl});

  final String articleImageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              articleImageUrl,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          );

  }
}
