import 'package:simplifi/components/beneficiary_item.dart';
import 'package:simplifi/components/home_head.dart';
import 'package:simplifi/components/transaction_card.dart';
import 'package:simplifi/features/simplifi/tabs/home/home_tab_controller.dart';
import 'package:simplifi/models/banking/beneficiary_model.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
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
                      const AppHeightSizedBox(height: 16),
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
                        child: BeneficiaryList(
                          controller: controller,
                        ),
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
                SliverToBoxAdapter(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: controller.getStreamFireStore(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        controller.transactionList = snapshot.data!.docs;
                        print(controller.transactionList.length);
                        //print(snapshot.data!.docs.first);
                        if (controller.transactionList.length > 0) {
                          return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              TransferTransactionModel transaction =
                                  TransferTransactionModel.fromFirestore(
                                      snapshot.data!.docs[index]);
                              bool debit =
                                  transaction.transactionState == 'debit';
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RoutesClass.getTransferReceiptRoute(),
                                      arguments: transaction);
                                },
                                child: TransactionCard(
                                  isDebit: debit,
                                  transaction: transaction,
                                ),
                              );
                            },
                            itemCount: snapshot.data!.docs.length,
                            reverse: false,
                            controller: controller.listScrollController,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'No Transaction sent yet',
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}

class BeneficiaryList extends StatelessWidget {
  final HomeController controller;
  const BeneficiaryList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.getBeneficiaryFireStore(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          controller.beneficiaryList = snapshot.data!.docs;
          print(controller.beneficiaryList.length);
          if (controller.beneficiaryList.length > 0) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              clipBehavior: Clip.none,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                BeneficiaryModel beneficiary =
                    BeneficiaryModel.fromFirestore(snapshot.data!.docs[index]);

                return GestureDetector(
                  onTap: () {},
                  child: BeneficiaryItem(
                    beneficiaryModel: beneficiary,
                  ),
                );
              },
              itemCount: snapshot.data!.docs.length,
              reverse: false,
              controller: controller.benelistScrollController,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No Beneficiary sent yet',
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

/*class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.getStreamFireStore(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          controller.joblists = snapshot.data!.docs;
          if (controller.joblists.length > 0) {
            return ListView.separated(
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                TransferTransactionModel transaction =
                    TransferTransactionModel.fromFirestore(
                        snapshot.data!.docs[index]);
                bool debit = transaction.transactionState == 'debit';
                return TransactionCard();
              },
              itemCount: snapshot.data!.docs.length,
              reverse: false,
              controller: controller.listScrollController,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 20,
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No Proposal sent yet',
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}*/
