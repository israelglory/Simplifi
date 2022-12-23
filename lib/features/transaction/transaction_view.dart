import 'package:simplifi/components/beneficiary_item.dart';
import 'package:simplifi/components/page_title_card.dart';
import 'package:simplifi/components/transaction_card.dart';
import 'package:simplifi/features/simplifi/tabs/home/home_tab_controller.dart';
import 'package:simplifi/features/transaction/transaction_controller.dart';
import 'package:simplifi/models/banking/beneficiary_model.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(
      init: TransactionController(),
      initState: (state) {},
      builder: (controller) {
        return SafeArea(
          top: true,
          child: RefreshIndicator(
            onRefresh: () async {},
            child: Scaffold(
                body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppHeightSizedBox(height: 16),
                      PageTitleCard(
                        title: 'Transactions',
                      ),
                      AppHeightSizedBox(height: 24),
                    ],
                  ),
                ),
                //const AppHeightSizedBox(height: 16),
                SliverToBoxAdapter(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: controller.getStreamFireStore(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        controller.transactionList = snapshot.data!.docs;

                        //print(snapshot.data!.docs.first);
                        if (controller.transactionList.isNotEmpty) {
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              TransferTransactionModel transaction =
                                  TransferTransactionModel.fromFirestore(
                                      snapshot.data!.docs[index]);
                              bool debit =
                                  transaction.transactionState == 'debit';
                              bool isAirtime = transaction.transactionType ==
                                  'Airtime Purchase';
                              return GestureDetector(
                                onTap: () {
                                  if (isAirtime) {
                                    Get.toNamed(
                                      RoutesClass.getAirtimeReceiptRoute(),
                                      arguments: transaction,
                                    );
                                  } else {
                                    Get.toNamed(
                                      RoutesClass.getTransferReceiptRoute(),
                                      arguments: transaction,
                                    );
                                  }
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

          if (controller.beneficiaryList.isNotEmpty) {
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
