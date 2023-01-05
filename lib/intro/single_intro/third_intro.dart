import 'package:simplifi/intro/intropage_controller.dart';
import 'package:simplifi/routes/exports.dart';

class ThirdIntro extends StatelessWidget {
  const ThirdIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.intro3,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        const SizedBox(
          height: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              'Seamless Banking',
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
                'Seamless banking for users of all ages, background and demography',
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
