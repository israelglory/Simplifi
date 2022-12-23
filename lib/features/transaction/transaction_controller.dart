import 'package:simplifi/routes/exports.dart';

class TransactionController extends GetxController {
  List<QueryDocumentSnapshot> transactionList = [];
  int limit = 20;
  int limitIncrement = 20;
  List<QueryDocumentSnapshot> beneficiaryList = [];
  final ScrollController listScrollController = ScrollController();
  final ScrollController benelistScrollController = ScrollController();

  @override
  void onInit() async {
    listScrollController.addListener(scrollListener);
    update();
    super.onInit();
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement;
      update();
    }
  }

  Stream<QuerySnapshot> getStreamFireStore() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('transactions')
        .orderBy('timeStamp', descending: true)
        .snapshots();
  }
}
