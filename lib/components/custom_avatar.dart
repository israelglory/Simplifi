import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String url;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
          height: height,
          width: width,
          child: url.startsWith("http") || url.startsWith("https")
              ? CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) {
                    return Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/simplifi-9e561.appspot.com/o/simplifi.png?alt=media&token=274064dc-c785-47f8-a19b-a30b02a46bf9');
                  },
                )
              : CachedNetworkImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/simplifi-9e561.appspot.com/o/simplifi.png?alt=media&token=274064dc-c785-47f8-a19b-a30b02a46bf9',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                )),
    );
  }
}
