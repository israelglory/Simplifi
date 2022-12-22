// ignore_for_file: file_names

import 'dart:io';

import 'package:simplifi/models/user/user_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/user_service/user_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileTabController extends GetxController {
  UserAuth userAuth = UserAuth();
  UserModel userData = UserModel();
  File? pickedImage;
  final _picker = ImagePicker();
  final _fireStorage = FirebaseStorage.instance;

  @override
  void onInit() async {
    await finalUserData();
    update();
    super.onInit();
  }

  Future<void> pickImage() async {
    XFile? image;
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage = File(image.path);
      print(pickedImage);
    }
    await uploadImage();
    await finalUserData();
    update();
  }

  ///Upload the image picked to firebase storage and assign uploadUrl to the uploaded picture(we are getting a string which is in form of link)
  Future<void> uploadImage() async {
    if (pickedImage != null) {
      final ref = _fireStorage
          .ref('userProfileImage')
          .child(FirebaseAuth.instance.currentUser!.uid);
      String? uploadUrl;
      try {
        await ref.putFile(pickedImage!);
        uploadUrl = await ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'avatar': uploadUrl,
        });
        Get.snackbar(
          "Sucsess",
          'Image Uploaded Successfully',
          dismissDirection: DismissDirection.horizontal,
          colorText: Colors.white,
          backgroundColor: AppColors.primaryColor,
          snackPosition: SnackPosition.TOP,
        );
      } catch (e) {
        Get.snackbar(
          "Error",
          'Unable to Image',
          dismissDirection: DismissDirection.horizontal,
          colorText: Colors.white,
          backgroundColor: AppColors.appRed,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  Future<void> finalUserData() async {
    final userinfo = await userAuth.getUserData();
    print(userinfo);

    userData = UserModel(
      accountNumber: userinfo['accountNumber'],
      avatar: userinfo['avatar'],
      email: userinfo['email'],
      firstName: userinfo['firstName'],
      lastName: userinfo['lastName'],
      passWord: userinfo['passWord'],
      pin: userinfo['pin'],
      userName: userinfo['userName'],
      accountBalance: userinfo['accountBalance'],
    );
    update();
  }

  void logOut() async {
    await userAuth.logOut();
    Get.offAndToNamed(RoutesClass.getIntroScreenRoute());
  }
}
