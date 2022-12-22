import 'package:simplifi/components/custom_avatar.dart';
import 'package:simplifi/models/banking/beneficiary_model.dart';
import 'package:simplifi/routes/exports.dart';

class AirtimeBeneficiaryItem extends StatelessWidget {
  final BeneficiaryModel beneficiaryModel;
  const AirtimeBeneficiaryItem({Key? key, required this.beneficiaryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAvatar(
          url: beneficiaryModel.bankLogo!,
          height: 42,
          width: 42,
        ),
        const AppHeightSizedBox(height: 4),
        AppText(
          beneficiaryModel.accountNumber!,
          size: 14,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }
}
