import 'package:articlely/core/extensions/snack_bar_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_routing/routes_names.dart';
import '../../../../core/models/auth_model.dart';
import '../../../../core/theme/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../manager/sign_up_cubit.dart';
import '../manager/sign_up_state.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              Navigator.pushReplacementNamed(context, RoutesNames.home);
              context.showCustomSnackBar(
                  "Create Account Successfully Welcome On Board");
            } else if (state is SignUpError) {
              context.showCustomSnackBar(state.message);
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: 45.h,
            child: ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final confirmPass = confirmPasswordController.text.trim();
                if (email.isEmpty || password.isEmpty || confirmPass.isEmpty) {
                  context.showCustomSnackBar("Please Fill All The Data");

                  return;
                }

                if (password != confirmPass) {
                  context.showCustomSnackBar("Password Do Not Match");

                  return;
                }

                context.read<SignUpCubit>().signUp(AuthenticationModel(
                    userEmail: email, userPassword: password));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Create account',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already Have An Account?",
              style: TextStyle(color: Colors.grey.shade500),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesNames.login);
              },
              child: const Text(
                'Log In',
                style: TextStyle(color: ColorManager.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
