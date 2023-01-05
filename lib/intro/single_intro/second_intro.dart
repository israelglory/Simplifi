import 'package:simplifi/intro/intropage_controller.dart';
import 'package:simplifi/routes/exports.dart';

class SecondIntro extends StatelessWidget {
  const SecondIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.intro2,
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
              'Fast Banking',
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
                'Bank with the speed of light. Say goodbye to slow and sluggish banking process',
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
