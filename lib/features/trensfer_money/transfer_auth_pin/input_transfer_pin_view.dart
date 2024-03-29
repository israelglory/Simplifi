import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simplifi/components/screen_button.dart';
import 'package:simplifi/features/trensfer_money/transfer_auth_pin/input_transfer_pin_cntroller.dart';
import 'package:simplifi/routes/exports.dart';

class InputTransferPinView extends StatelessWidget {
  const InputTransferPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputTranserPinController>(
      init: InputTranserPinController(),
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
          top: true,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              AppText(
                'Enter Your Pin',
                size: 25,
                alignment: TextAlign.left,
                maxLines: 2,
                color: AppColors.primaryColor,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscuringCharacter: '*',
                  obscureText: true,
                  keyboardType: TextInputType.none,
                  cursorColor: AppColors.primaryColor,
                  onChanged: (val) async {
                    if (val.length == 4) {
                      await Future.delayed(
                        const Duration(seconds: 1),
                      );
                      controller.onCompleted(val);
                    }
                  },
                  enableActiveFill: false,
                  controller: controller.pinController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 80,
                    fieldWidth: 70,
                    disabledColor: AppColors.primaryColor,
                    //inactiveFillColor: AppColors.primaryColor,
                    borderWidth: 2,
                    inactiveColor: AppColors.primaryColor,
                    activeColor: AppColors.primaryColor,
                    //selectedFillColor: AppColors.primaryColor,
                    //activeFillColor: AppColors.primaryColor,
                    selectedColor: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    width: MediaQuery.of(context).size.width * 1,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('1');
                              },
                              digit: '1',
                            ),
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('2');
                              },
                              digit: '2',
                            ),
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('3');
                              },
                              digit: '3',
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('4');
                              },
                              digit: '4',
                            ),
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('5');
                              },
                              digit: '5',
                            ),
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('6');
                              },
                              digit: '6',
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('7');
                              },
                              digit: '7',
                            ),
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('8');
                              },
                              digit: '8',
                            ),
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('9');
                              },
                              digit: '9',
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const EmptyScreenButton(),
                            ScreenButton(
                              onPressed: () {
                                controller.onButtonClick('0');
                              },
                              digit: '0',
                            ),
                            Visibility(
                              visible:
                                  !(controller.pinController.text.length < 1),
                              replacement: FingePrintButton(
                                onPressed: () async {
                                  await controller.authenticateUser();
                                },
                              ),
                              child: BackSpaceButton(
                                onPressed: () {
                                  controller.onBackspace();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
      },
    );
  }
}
