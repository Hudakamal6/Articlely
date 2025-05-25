import 'package:articlely/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/helpers_functions.dart';
import '../manager/categories/categories_cubit.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off,
              color: ColorManager.primaryColor,
              size: 70.sp,
            ),
            SizedBox(height: 20.h),
            Text(
              "Something went wrong",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              "Please try refreshing the page.",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            ElevatedButton.icon(
              onPressed: () {
                HelpersFunctions.checkCurrentSelectedCategoryIndex(
                  context.read<CategoryCubit>().selectedIndex,
                  context,
                  context.read<CategoryCubit>().state.selectedCategory,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              icon: Icon(
                Icons.refresh,
                size: 20.sp,
                color: ColorManager.primaryColor,
              ),
              label: Text(
                'Refresh',
                style: TextStyle(
                    fontSize: 14.sp, color: ColorManager.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
