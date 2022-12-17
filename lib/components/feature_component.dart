import 'package:simplifi/routes/exports.dart';

class FeatureComponent extends StatelessWidget {
  final IconData theIcon;
  final String title;
  final Function() onPressed;
  const FeatureComponent(
      {Key? key,
      required this.theIcon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(
            left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
        child: Column(
          children: [
            Icon(
              theIcon,
              color: AppColors.primaryColor,
            ),
            AppText(
              title,
              size: 12,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
