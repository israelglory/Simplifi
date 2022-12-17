import 'package:simplifi/routes/exports.dart';

class ScreenButton extends StatelessWidget {
  final String digit;
  final Function() onPressed;
  const ScreenButton({Key? key, required this.digit, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        //color: Colors.grey.shade200,
      ),
      margin: const EdgeInsets.fromLTRB(0, 15, 15, 15),
      height: MediaQuery.of(context).size.height * 0.1 * 0.9,
      child: TextButton(
        onPressed: onPressed,
        child: AppText(
          digit,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}

class EmptyScreenButton extends StatelessWidget {
  const EmptyScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        //color: Colors.white,
      ),
      margin: const EdgeInsets.fromLTRB(0, 15, 15, 15),
      height: MediaQuery.of(context).size.height * 0.1 * 0.9,
    );
  }
}

class BackSpaceButton extends StatelessWidget {
  final Function() onPressed;
  const BackSpaceButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        //color: Colors.grey.shade200,
      ),
      margin: const EdgeInsets.fromLTRB(0, 15, 15, 15),
      height: MediaQuery.of(context).size.height * 0.1 * 0.9,
      child: InkWell(
          onTap: onPressed,
          child: SvgPicture.asset(
            AppAssets.backSpace,
            height: 30,
            fit: BoxFit.none,
            width: 30,
          )),
    );
  }
}
