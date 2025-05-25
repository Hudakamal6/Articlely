import 'package:articlely/core/helpers/helpers_functions.dart';
import 'package:articlely/features/news/presentation/manager/categories/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../manager/news/news_cubit.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  void _clearSearch() {
    _controller.clear();
    HelpersFunctions.checkCurrentSelectedCategoryIndex(
        context.read<CategoryCubit>().selectedIndex,
        context,
        context.read<CategoryCubit>().state.selectedCategory);

    FocusScope.of(context).unfocus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isTyping = _controller.text.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primaryColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
            controller: _controller,
            cursorColor: ColorManager.primaryColor,
            style: TextStyle(color: Colors.black87, fontSize: 13.sp),
            decoration: InputDecoration(
              hintText: 'Search by keyword...',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: InputBorder.none,
              prefixIcon:
                  const Icon(Icons.search, color: ColorManager.primaryColor),
              suffixIcon: isTyping
                  ? GestureDetector(
                      onTap: _clearSearch,
                      child: const Icon(Icons.close,
                          color: ColorManager.primaryColor),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(vertical: 13.h),
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                _clearSearch();
              } else if (value.length > 2) {
                context.read<NewsCubit>().getNews(
                    '${Constants.apiBaseUrl}${Constants.getNewApi}$value');
              }
              setState(() {});
            },
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            }),
      ),
    );
  }
}
