import 'package:simplifi/components/custom_avatar.dart';
import 'package:simplifi/features/simplifi/tabs/more/profile_tab_controller.dart';
import 'package:simplifi/routes/exports.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileTabController>(
      init: ProfileTabController(),
      initState: (state) {},
      builder: (controller) {
        return SafeArea(
          top: true,
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppHeightSizedBox(height: 25),
                //Avatar with cmera
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        controller.pickedImage == null
                            ? CustomAvatar(
                                url: controller.userData.avatar ?? '',
                                height: 170,
                                width: 170,
                              )
                            : CircleAvatar(
                                radius: 75,
                                backgroundImage: FileImage(
                                  controller.pickedImage!,
                                ),
                              ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle),
                            padding: const EdgeInsets.all(13.0),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //FullName
                AppText(
                  '${controller.userData.firstName ?? 'no'} ${controller.userData.lastName ?? 'name'}',
                  size: 28,
                  fontWeight: FontWeight.w600,
                ),
                //Email Address
                const SizedBox(
                  height: 5,
                ),
                AppText(
                  controller.userData.accountNumber ?? 'XXXXXXXXXX',
                  size: 25,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Edit profile button
                AppButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                            text: controller.userData.accountNumber!))
                        .then((_) {
                      Get.snackbar(
                        "Sucsess",
                        'Account number copied ${controller.userData.accountNumber!}',
                        dismissDirection: DismissDirection.horizontal,
                        colorText: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                        snackPosition: SnackPosition.TOP,
                      );
                    });
                  },
                  radius: 50,
                  color: AppColors.primaryColor,
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  child: const AppText(
                    'Copy Account Number',
                    color: Colors.white,
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /*ProfileTile(
                        text: 'Favourite',
                        onPressed: () {
                          Get.toNamed(RoutesClass.getParentFavouriteRoute());
                        },
                        image: 'assets/icons/child_icon.png',
                      ),*/
                const SizedBox(
                  height: 20,
                ),
                ProfileTile(
                  text: 'Change Pin',
                  onPressed: () {
                    Get.toNamed(RoutesClass.getInputPinRoute());
                  },
                  image: Icons.edit,
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: AppColors.textFieldBackgroundColor,
                  height: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: 'Transactions',
                  onPressed: () {
                    Get.toNamed(RoutesClass.getTransactionRoute());
                  },
                  image: Icons.money,
                ),
                const SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: 'Get more Money',
                  onPressed: () {
                    controller.getMoreMoney();
                  },
                  image: Icons.attach_money,
                ),
                const SizedBox(
                  height: 50,
                ),
                ProfileTile(
                  text: 'About me',
                  onPressed: () {
                    Get.toNamed(RoutesClass.getAboutRoute());
                  },
                  image: Icons.person,
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileTile(
                  text: 'Log Out',
                  onPressed: () {
                    controller.logOut();
                  },
                  image: Icons.exit_to_app,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.image})
      : super(key: key);
  final String text;
  final IconData image;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppColors.textFieldBackgroundColor,
              ),
              child: Icon(
                image,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: AppText(
                text,
                fontWeight: FontWeight.w500,
                size: 18,
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
