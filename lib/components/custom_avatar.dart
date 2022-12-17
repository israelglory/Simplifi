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
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png');
                  },
                )
              : CachedNetworkImage(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                )),
    );
  }
}
