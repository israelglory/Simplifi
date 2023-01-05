import 'package:flutter/cupertino.dart';
import 'package:simplifi/onboarding/sign_up/sign_up_controller.dart';
import 'package:simplifi/routes/exports.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      initState: (state) {},
      builder: (controller) {
        return SafeArea(
          top: true,
          bottom: true,
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
                      'Create an account',
                      color: AppColors.primaryColor,
                      size: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.firstNameController,
                    textCapitalization: TextCapitalization.words,
                    formText: 'First Name',
                    hintText: 'Enter first name',
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    textInputAction: TextInputAction.next,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.lastNameController,
                    textCapitalization: TextCapitalization.words,
                    formText: 'Last Name',
                    hintText: 'Enter last name',
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    textInputAction: TextInputAction.next,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.emailController,
                    formText: 'Email address',
                    hintText: 'johnDoe@example.com',
                    maxLines: 1,
                    textInputType: TextInputType.emailAddress,
                    borderWidth: 2,
                    textInputAction: TextInputAction.next,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.userNameController,
                    formText: 'Username',
                    hintText: 'Enter username',
                    textCapitalization: TextCapitalization.words,
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
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
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
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.confirmPassController,
                    formText: 'Confirm password',
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    obscureText: controller.show,
                    textCapitalization: TextCapitalization.words,
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
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 28),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Checkbox(
                          splashRadius: 10,
                          activeColor: AppColors.primaryColor,
                          value: controller.terms,
                          onChanged: (val) {
                            controller.onTermAccept(val!);
                          },
                        ),
                      ),
                      const AppText(
                        'I accept the',
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            //Get.toNamed(RoutesClass.getLoginRoute());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: AppText(
                              ' Terms of Service and Privacy Policy',
                              size: 14,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const AppHeightSizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: AppButton(
                      elevation: 0,
                      width: double.infinity,
                      //padding: const EdgeInsets.all(12.0),
                      radius: 8,
                      onPressed: () {
                        controller.signUp();
                      },
                      color: AppColors.primaryColor,
                      child: Visibility(
                        visible: !controller.inProgress,
                        replacement: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(17.0),
                          child: AppText(
                            'Sign Up',
                            color: Colors.white,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const AppHeightSizedBox(height: 24),

                  ///Sign Up
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        'Have An Account?',
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RoutesClass.getLoginRoute());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: AppText(
                            'Sign In',
                            size: 15,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const AppHeightSizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
