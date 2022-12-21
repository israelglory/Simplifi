import 'package:simplifi/components/beneficiary_item.dart';
import 'package:simplifi/components/page_title_card.dart';
import 'package:simplifi/features/trensfer_money/transfer_money_controller.dart';
import 'package:simplifi/routes/exports.dart';

class TransferMoneyView extends StatelessWidget {
  const TransferMoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferMoneyController>(
      init: TransferMoneyController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageTitleCard(
                    title: 'Transfer Money',
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
                    child: const BeneficiaryList(),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: DropdownButton(
                            items: controller.listOfbanks.map((e) {
                              return DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: e,
                                child: AppText(
                                  e.name,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.selectBank(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.accountNumber,
                    formText: 'Account Number',
                    onChanged: (val) {
                      if (val.length == 10) {
                        controller.getBankDetails();
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
                  const AppHeightSizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AppText(
                      controller.bankDetails.accountName ?? '',
                      size: 15,
                    ),
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.bankName,
                    formText: 'Bank Name',
                    hintText: 'Kuda MFB',
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.amount,
                    formText: 'Amount',
                    hintText: '10000',
                    maxLines: 1,
                    borderWidth: 2,
                    borderColor: AppColors.transBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  const AppHeightSizedBox(height: 16),
                  AppFormTextField(
                    textEditingController: controller.description,
                    formText: 'Amount',
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
