import 'package:articlely/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDescriptionWidget extends StatelessWidget {
  const ArticleDescriptionWidget({super.key, required this.articleDescription});
  final String articleDescription ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(14.h),
      decoration: BoxDecoration(
        color: ColorManager.babyBlue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.babyBlue.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.primaryColor,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
           articleDescription,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black87,
              height: 1.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
