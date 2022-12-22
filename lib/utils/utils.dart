import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Function That Converts Hex Code To Flutter Recognized Color
///
/// [params]
/// [hexCode]: The Hex Code To Be Converted
///
/// Example
///
/// fromHex('#5265ff')
Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

///This Validate if an email address is correct
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this);
  }
}

////Getting Bank images
String getBankImage(String bankName) {
  if (bankName == 'Access Bank' || bankName == 'Access Bank(Diamond)') {
    return 'https://play-lh.googleusercontent.com/Ia-Xy0pLc9iPuWx_9ZGIJPL5umWap7FWO1cANQVb7ONRg4ckAXnO1oVTXefRtW95TEo';
  } else {
    return 'https://firebasestorage.googleapis.com/v0/b/simplifi-9e561.appspot.com/o/simplifi.png?alt=media&token=274064dc-c785-47f8-a19b-a30b02a46bf9';
  }
}

String getProviderImage(String bankName) {
  if (bankName == 'MTN') {
    return 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/New-mtn-logo.jpg/800px-New-mtn-logo.jpg';
  } else if (bankName == 'Airtel') {
    return 'https://mir-s3-cdn-cf.behance.net/project_modules/fs/3126249384889.57ee562a52f15.jpg';
  } else if (bankName == 'GLO') {
    return 'https://mir-s3-cdn-cf.behance.net/projects/404/40dd9197247519.5ec157b829648.png';
  } else if (bankName == '9Mobile') {
    return 'data:image/png;base64,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';
  } else {
    return 'https://firebasestorage.googleapis.com/v0/b/simplifi-9e561.appspot.com/o/simplifi.png?alt=media&token=274064dc-c785-47f8-a19b-a30b02a46bf9';
  }
}

///Lunching URl
Future<void> launchUrlStart({required String url}) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
