import 'package:articlely/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/helpers_functions.dart';

class ArticleDateWidget extends StatelessWidget {
  const ArticleDateWidget({
    super.key,
     required this.articleSourceName, required this.articlePublishedAt,
  });

  final String articleSourceName;
  final String articlePublishedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: ColorManager.babyBlue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Text(
            articleSourceName,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: ColorManager.primaryColor,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(Icons.calendar_month,
                size: 14, color: ColorManager.primaryColor),
            SizedBox(width: 4.w),
            Text(
              HelpersFunctions.formatDate(
                  articlePublishedAt),
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
