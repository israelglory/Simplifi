import 'package:simplifi/routes/exports.dart';

class AppHeightSizedBox extends StatelessWidget {
  final double height;
  const AppHeightSizedBox({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
