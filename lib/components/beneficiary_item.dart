import 'package:simplifi/components/custom_avatar.dart';
import 'package:simplifi/routes/exports.dart';

class BeneficiaryItem extends StatelessWidget {
  const BeneficiaryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CustomAvatar(
          url:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/GTBank_logo.svg/120px-GTBank_logo.svg.png?20210128021936',
          height: 42,
          width: 42,
        ),
        AppHeightSizedBox(height: 4),
        AppText(
          'Boma',
          size: 14,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }
}
