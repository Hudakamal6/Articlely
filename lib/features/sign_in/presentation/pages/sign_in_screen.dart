import 'package:articlely/core/widgets/animated_text_container.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../widgets/sign_in_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.babyBlue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AnimatedTextContainer(),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.all(25.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  width: 400.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300.w,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'Login to your account',
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            isRepeatingAnimation: false,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text('Email', style: TextStyle(fontSize: 16.sp)),
                      SizedBox(height: 8.h),
                      CustomTextField(
                          controller: emailController,
                          hintText: 'abcd@gmail.com',
                          isPassword: false),
                      SizedBox(height: 15.h),
                      Text('Password', style: TextStyle(fontSize: 16.sp)),
                      SizedBox(height: 5.h),
                      CustomTextField(
                          controller: passwordController,
                          hintText: 'Enter Your Password',
                          isPassword: true),
                      SizedBox(height: 50.h),
                      SignInWidget(
                        emailController: emailController,
                        passwordController: passwordController,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
