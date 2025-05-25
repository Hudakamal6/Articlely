import 'package:articlely/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    super.key,
    required this.articleAuthor,
  });

  final String articleAuthor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.person,
            size: 18, color: ColorManager.primaryColor),
        SizedBox(width: 6.w),
        Text(
          articleAuthor,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
