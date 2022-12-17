import 'package:simplifi/routes/exports.dart';

class PageTitleCard extends StatelessWidget {
  final String title;
  const PageTitleCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            color: AppColors.primaryColor,
            image: const DecorationImage(
              opacity: 500,
              fit: BoxFit.fill,
              image: AssetImage(
                AppAssets.intro1,
              ),
            ),
          ),
          margin: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          height: 144,
          width: double.infinity,
        ),
        Positioned(
          top: 20.0,
          left: 30.0,
          child: AppText(
            title,
            color: Colors.white,
            size: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
