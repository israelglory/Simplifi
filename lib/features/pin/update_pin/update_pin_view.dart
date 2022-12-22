import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simplifi/components/screen_button.dart';
import 'package:simplifi/features/pin/update_pin/update_pin_controller.dart';
import 'package:simplifi/routes/exports.dart';

class UpdatePinView extends StatelessWidget {
  const UpdatePinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePinController>(
      init: UpdatePinController(),
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
                'Update Your Pin',
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
                  onChanged: (val) {
                    if (val.length == 4) {
                      print('Completed');
                      print(val);
                      print(controller.pinController.text);
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
                            BackSpaceButton(
                              onPressed: () {
                                controller.onBackspace();
                              },
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
