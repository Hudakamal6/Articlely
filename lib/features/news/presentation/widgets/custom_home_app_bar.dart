import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/helpers_functions.dart';
import '../../../../core/theme/color_manager.dart';
import '../manager/categories/categories_cubit.dart';

class CustomArticleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomArticleAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.babyBlue.withOpacity(0.3),
      title: const Text(
        'Articlely',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(
          'assets/jpgImages/logo.jpg',
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            HelpersFunctions.checkCurrentSelectedCategoryIndex(
              context.read<CategoryCubit>().selectedIndex,
              context,
              context.read<CategoryCubit>().state.selectedCategory,
            );
          },
          icon: const Icon(
            Icons.refresh_sharp,
            color: ColorManager.primaryColor,
            size: 35,
          ),
        ),
      ],
    );
  }
}
