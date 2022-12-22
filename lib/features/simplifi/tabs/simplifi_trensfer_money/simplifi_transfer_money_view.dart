import 'package:simplifi/components/beneficiary_item.dart';
import 'package:simplifi/components/page_title_card.dart';
import 'package:simplifi/features/simplifi/tabs/simplifi_trensfer_money/simplifi_transfer_money_controller.dart';
import 'package:simplifi/models/banking/beneficiary_model.dart';
import 'package:simplifi/routes/exports.dart';

class SimplifiTransferMoneyView extends StatelessWidget {
  const SimplifiTransferMoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SimplifiTransferMoneyController>(
      init: SimplifiTransferMoneyController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageTitleCard(
                    title: 'Simplifi to Simplifi Transfer',
                  ),
                  const AppHeightSizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AppText(
                      'Choose beneficiary',
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
                  Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AppText(
                      'Send to new beneficiary',
                      size: 20,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const AppHeightSizedBox(height: 16),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.accountNumber,
                    formText: 'Account Number',
                    onChanged: (val) {
                      if (val.length == 10) {
                        controller.resolveAccount();
                      } else if (val.length > 10) {
                        controller.resetAccName();
                      }
                    },
                    hintText: '0123456789',
                    textInputType: TextInputType.number,
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AppText(
                      controller.accName,
                      size: 15,
                    ),
                  ),
                  const AppHeightSizedBox(height: 8),
                  AppFormTextField(
                    textEditingController: controller.amount,
                    formText: 'Amount',
                    hintText: '10000',
                    textInputType: TextInputType.number,
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.description,
                    formText: 'Description',
                    hintText: 'for goods',
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 54),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: AppButton(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      radius: 8,
                      onPressed: () {
                        controller.onTransferMoney();
                      },
                      color: AppColors.primaryColor,
                      child: const AppText(
                        'Send',
                        color: Colors.white,
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const AppHeightSizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BeneficiaryList extends StatelessWidget {
  final SimplifiTransferMoneyController controller;
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
                  onTap: () {
                    controller.onBeneficiarySelect(beneficiary.accountNumber!);
                  },
                  child: BeneficiaryItem(
                    beneficiaryModel: beneficiary,
                  ),
                );
              },
              itemCount: snapshot.data!.docs.length,
              reverse: false,
              controller: controller.listScrollController,
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
