import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/color_manager.dart';

class EmptyAriclesWidget extends StatelessWidget {
  const EmptyAriclesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0.h),
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: SvgPicture.asset(
                    'assets/svgImages/no_search_result.svg',
                    fit: BoxFit.cover,
                  )),
              Text(
                'No Articles Found!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: ColorManager.primaryColor),
              )
            ],
          )),
    );
  }
}
