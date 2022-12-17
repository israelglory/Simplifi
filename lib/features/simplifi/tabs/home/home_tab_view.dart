import 'package:simplifi/components/beneficiary_item.dart';
import 'package:simplifi/components/home_head.dart';
import 'package:simplifi/components/transaction_card.dart';
import 'package:simplifi/features/simplifi/tabs/home/home_tab_controller.dart';
import 'package:simplifi/routes/exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (state) {},
      builder: (controller) {
        return SafeArea(
          top: true,
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.finalUserData();
            },
            child: Scaffold(
                body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(
                        title:
                            'Welcome back, ${controller.userData.firstName ?? ''}',
                        accountBalance: controller.noSimbolInUSFormat.format(
                          controller.userData.accountBalance ?? 0,
                        ),
                        show: controller.show,
                        accountNumber: controller.userData.accountNumber ??
                            'not available',
                        onObscure: () {
                          controller.onObscure();
                        },
                        onhide: () {
                          controller.onhide();
                        },
                        avatar: controller.userData.avatar ?? '',
                      ),
                      const AppHeightSizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: AppText(
                          'Send money to friends',
                          size: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16.0),
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: const BeneficiaryList(),
                      ),
                      //const AppHeightSizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: AppText(
                          'Recent transactions',
                          size: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const AppHeightSizedBox(height: 24),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: TransactionList(),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}

class BeneficiaryList extends StatelessWidget {
  const BeneficiaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return const BeneficiaryItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 18);
      },
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      //physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return const TransactionCard();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 25);
      },
    );
  }
}
