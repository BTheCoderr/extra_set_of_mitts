import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:two_local_gals_housekeeping/config/routes/routes.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_fonts.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_sizes.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/presentation/bloc/auth/auth_bloc.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_rectangle_btn.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_textfield.dart';
import 'package:two_local_gals_housekeeping/view/widget/my_text_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          authenticated: (state) {
            if (state.showWalkthrough) {
              Get.offNamed(AppLinks.onboarding);
            } else {
              Get.offNamed(AppLinks.home);
            }
          },
          error: (state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Container(
        decoration: AppStyling().background_image_decoration(),
        child: Scaffold(
          backgroundColor: kTransparentColor,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppStyling().verticalGap(100),
                  CommonImageView(
                    height: 174,
                    imagePath: Assets.imagesLogoIcon,
                  ),
                  AppStyling().verticalGap(40),
                  CustomTextField(
                    controller: _usernameController,
                    hintText: 'Username',
                    prefixIcon: Assets.imagesPersonIcon,
                  ),
                  AppStyling().verticalGap(20),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    prefixIcon: Assets.imagesKeyIcon,
                    obscureText: !_isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: kTertiaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  AppStyling().verticalGap(40),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomRectangleBtn(
                              onPressed: state.maybeMap(
                                loading: (_) => null,
                                orElse: () => () {
                                  context.read<AuthBloc>().add(
                                    AuthEvent.loginWithCredentials(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                },
                              ),
                              txt: 'Log In',
                              isLoading: state.maybeMap(
                                loading: (_) => true,
                                orElse: () => false,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  AppStyling().verticalGap(40),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        context.read<AuthBloc>().add(
                          const AuthEvent.loginWithBiometrics(),
                        );
                      },
                      child: Container(
                        height: 56,
                        width: 54,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: CommonImageView(
                            imagePath: Assets.imagesFingerPrint,
                            height: 24,
                            width: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: MyText(
                      paddingTop: 26,
                      text: 'Use Fingerprint',
                      weight: FontWeight.w500,
                      size: 20,
                      fontFamily: AppFonts.Jost,
                      color: kTertiaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
