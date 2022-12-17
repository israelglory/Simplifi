import 'package:flutter/cupertino.dart';
import 'package:simplifi/components/custom_avatar.dart';
import 'package:simplifi/components/feature_component.dart';
import 'package:simplifi/routes/exports.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  const HomeHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            right: 10.0,
            child: Row(
              children: [
                const CustomAvatar(
                  url: '',
                  height: 32,
                  width: 32,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                AppText(
                  title,
                  color: Colors.white,
                  size: 20,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            bottom: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppText(
                  'Available Balance',
                  size: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                AppHeightSizedBox(height: 0),
                AppText(
                  '₦150,923.56',
                  size: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 20.0,
            right: 20.0,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              //spacing: 16.0,
              alignment: WrapAlignment.spaceAround,
              children: [
                FeatureComponent(
                  theIcon: CupertinoIcons.rocket_fill,
                  title: 'Transfer',
                  onPressed: () {
                    Get.toNamed(RoutesClass.getTransferMoneyRoute());
                  },
                ),
                FeatureComponent(
                  theIcon: CupertinoIcons.device_phone_portrait,
                  title: 'Recharge',
                  onPressed: () {
                    Get.toNamed(RoutesClass.getRechargeAirtimeRoute());
                  },
                ),
                FeatureComponent(
                  theIcon: CupertinoIcons.money_dollar_circle,
                  title: 'Pay Bills',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
