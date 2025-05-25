import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/helpers_functions.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../manager/categories/categories_cubit.dart';

class CategoryGridSelector extends StatelessWidget {
  const CategoryGridSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    final selectedCategory =
        context.watch<CategoryCubit>().state.selectedCategory;

    return SizedBox(
      height: 90.h,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 4,
        ),
        itemCount: cubit.categories.length,
        itemBuilder: (context, index) {
          final category = cubit.categories[index];
          final isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () {
              if (context.read<CategoryCubit>().selectedIndex != index) {
                cubit.selectCategory(category, index);

                HelpersFunctions.checkCurrentSelectedCategoryIndex(
                    index, context, category);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorManager.primaryColor.withOpacity(0.9)
                    : ColorManager.babyBlue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: ColorManager.primaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
                child: Text(category),
              ),
            ),
          );
        },
      ),
    );
  }
}
