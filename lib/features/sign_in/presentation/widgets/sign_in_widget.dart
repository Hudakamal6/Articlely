import 'package:articlely/core/extensions/snack_bar_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_routing/routes_names.dart';
import '../../../../core/models/auth_model.dart';
import '../../../../core/theme/color_manager.dart';
import '../manager/sign_in_cubit.dart';
import '../manager/sign_in_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInWidget extends StatelessWidget {
  final TextEditingController emailController;

  final TextEditingController passwordController;

  const SignInWidget(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 45.h,
          child: BlocListener<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                Navigator.pushReplacementNamed(context, RoutesNames.home);
                context.showCustomSnackBar("Welcome Back");

              } else if (state is SignInError) {
                context.showCustomSnackBar(state.message);

              }
            },
            child: ElevatedButton(
              onPressed: () async {
                if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                  context.read<SignInCubit>().signIn(AuthenticationModel(
                    userEmail: emailController.text.trim(),
                    userPassword: passwordController.text.trim(),
                  ));
                }else{
                  context.showCustomSnackBar("Please Fill All The Data ");

                }

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
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
              "Don't Have An Account?",
              style: TextStyle(color: Colors.grey.shade500),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesNames.signUp);
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: ColorManager.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

