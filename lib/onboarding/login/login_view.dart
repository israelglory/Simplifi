import 'package:flutter/cupertino.dart';
import 'package:simplifi/onboarding/login/login_controller.dart';
import 'package:simplifi/routes/exports.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      initState: (state) {},
      builder: (controller) {
        return SafeArea(
          top: true,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeightSizedBox(height: 30),
                  Center(
                    child: SvgPicture.asset(
                      AppAssets.appLogoSvg,
                      height: 80,
                      width: 64,
                    ),
                  ),
                  const AppHeightSizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: AppText(
                      'Log in to your account',
                      color: AppColors.primaryColor,
                      size: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.emailController,
                    formText: 'Email address',
                    hintText: 'johnDoe@example.com',
                    textInputType: TextInputType.emailAddress,
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    textInputAction: TextInputAction.next,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.passController,
                    formText: 'Password',
                    textCapitalization: TextCapitalization.words,
                    maxLines: 1,
                    obscureText: controller.show,
                    suffixIcon: controller.show == true
                        ? InkWell(
                            onTap: () {
                              controller.onObscure();
                            },
                            child: const Icon(
                              CupertinoIcons.eye_fill,
                            ))
                        : InkWell(
                            onTap: () {
                              controller.onhide();
                            },
                            child: const Icon(
                              CupertinoIcons.eye_slash_fill,
                            ),
                          ),
                    hintText: '********',
                    textInputAction: TextInputAction.done,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AppButton(
                      child: AppText(
                        'Forget Password?',
                        color: AppColors.primaryColor,
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const AppHeightSizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: AppButton(
                      elevation: 0,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      radius: 8,
                      onPressed: () {
                        controller.login();
                      },
                      color: AppColors.primaryColor,
                      child: Visibility(
                        visible: !controller.inProgress,
                        replacement: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        child: const AppText(
                          'Login',
                          color: Colors.white,
                          size: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const AppHeightSizedBox(height: 30),

                  ///Login with biometrics
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.appRed,
                                height: 2,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const AppText('Log in using Biometrics'),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.appRed,
                                height: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                      const AppHeightSizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.fingerPrint,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          SvgPicture.asset(
                            AppAssets.faceId,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const AppHeightSizedBox(height: 60),

                  ///Sign Up
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        'Doesn\'t Have An Account?',
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RoutesClass.getRegisterRoute());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: AppText(
                            'Sign Up',
                            size: 15,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
