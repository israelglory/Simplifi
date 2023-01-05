import 'package:simplifi/intro/intropage_controller.dart';
import 'package:simplifi/routes/exports.dart';

class FirstIntro extends StatelessWidget {
  const FirstIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.intro1,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              'Easy Banking',
              color: AppColors.primaryColor,
              size: 32,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: AppText(
                'Bank with ease. Say goodbye to complex banking',
                color: AppColors.primaryColor,
                alignment: TextAlign.center,
                size: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
