import 'package:flutter/material.dart';

import '../../../../../core/helpers/helpers_functions.dart';
import '../../../../../core/theme/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenArticleUrlButton extends StatelessWidget {
  const OpenArticleUrlButton({
    super.key,
    required this.articleUrl,
  });

  final String articleUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          HelpersFunctions.launchURL(articleUrl);
        },
        icon: const Icon(Icons.open_in_new,
            color: ColorManager.primaryColor),
        label: const Text(
          'Read Full Article',
          style: TextStyle(color: ColorManager.primaryColor),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: 24.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: Colors.blue.shade50,
        ),
      ),
    );
  }
}
