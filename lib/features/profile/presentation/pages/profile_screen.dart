import 'package:articlely/core/app_routing/routes_names.dart';
import 'package:articlely/core/theme/color_manager.dart';
import 'package:articlely/core/userAuth/presentation/cubit/check_user_auth_cubit.dart';
import 'package:articlely/core/userAuth/presentation/cubit/check_user_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CheckUserAuthCubit>().checkAuthStatus();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: ColorManager.babyBlue.withOpacity(0.3),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.h),
          child: Center(
            child: BlocConsumer<CheckUserAuthCubit, CheckUserAuthState>(
              listener: (context, state) {
                if(state is UserNotLoggedIn){
                  Navigator.pushReplacementNamed(
                      context, RoutesNames.login);
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: ColorManager.babyBlue,
                      child: Icon(
                        Icons.person,
                        size: 50.r,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      context
                          .read<CheckUserAuthCubit>()
                          .user,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    BlocListener<CheckUserAuthCubit, CheckUserAuthState>(
                      listener: (context, state) {},
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.read<CheckUserAuthCubit>().signOut();

                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Log Out ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.w, vertical: 12.h),
                          backgroundColor:
                          ColorManager.primaryColor.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
