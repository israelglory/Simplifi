import 'package:simplifi/components/custom_avatar.dart';
import 'package:simplifi/routes/exports.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          const CustomAvatar(
            url:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/GTBank_logo.svg/120px-GTBank_logo.svg.png?20210128021936',
            height: 42,
            width: 42,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppText(
                  'Boma Daudu',
                  fontWeight: FontWeight.w600,
                  size: 14,
                ),
                AppHeightSizedBox(
                  height: 2,
                ),
                AppText(
                  '08:33 AM',
                  fontWeight: FontWeight.w400,
                  size: 12,
                )
              ],
            ),
          ),
          const AppText(
            '+₦30,000',
            fontWeight: FontWeight.w600,
            color: Colors.green,
            size: 14,
          )
        ],
      ),
    );
  }
}
