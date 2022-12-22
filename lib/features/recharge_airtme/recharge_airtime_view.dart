import 'package:simplifi/components/airtime_beneficiary_item.dart';
import 'package:simplifi/components/beneficiary_item.dart';
import 'package:simplifi/components/page_title_card.dart';
import 'package:simplifi/features/recharge_airtme/recharge_airtime_controller.dart';
import 'package:simplifi/models/banking/beneficiary_model.dart';
import 'package:simplifi/routes/exports.dart';

class RechargeAirtimeView extends StatelessWidget {
  const RechargeAirtimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RechargeAirtimeController>(
      init: RechargeAirtimeController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeightSizedBox(height: 16),
                  const PageTitleCard(
                    title: 'Recharge airtime',
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
                  /*AppFormTextField(
                    textEditingController: controller.networkProvider,
                    formText: 'Network Provider',
                    hintText: 'MTN',
                    textInputType: TextInputType.name,
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),*/
                  Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AppText(
                      'Select Network',
                      size: 20,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const AppHeightSizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          controller.selectedNetwork,
                          size: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.bottomBankSelection();
                          },
                          child: const AppText(
                            'Select Network',
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.phoneNumber,
                    formText: 'Phone Number',
                    hintText: '08141208203',
                    textInputType: TextInputType.number,
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.amount,
                    textInputType: TextInputType.number,
                    formText: 'Amount',
                    hintText: '10000',
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
                        controller.onRechargeAirtime();
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

/*class BeneficiaryList extends StatelessWidget {
  const BeneficiaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      
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
}*/

class BeneficiaryList extends StatelessWidget {
  final RechargeAirtimeController controller;
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
                    controller.onBeneficiarySelected(
                        beneficiary.accountNumber!, beneficiary.bankName!);
                  },
                  child: AirtimeBeneficiaryItem(
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
