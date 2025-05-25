import 'package:articlely/features/news/presentation/pages/news_home_screen.dart';
import 'package:articlely/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color_manager.dart';
import '../manager/nav_bar_cubit.dart';

class NavBarScreen extends StatelessWidget {
  final List<Widget> screens = [
    const NewsHomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, int>(
      builder: (context, index) {
        return Scaffold(
          extendBody: true,
          body: screens[index],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: BottomNavigationBar(
                backgroundColor: ColorManager.babyBlue.withOpacity(0.3),
                currentIndex: index,
                onTap: (i) => context.read<NavBarCubit>().changeTab(i),
                selectedItemColor: ColorManager.primaryColor,
                unselectedItemColor: Colors.black87,
                selectedFontSize: 11.sp,
                unselectedFontSize: 11.sp,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    activeIcon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_sharp),
                    activeIcon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
