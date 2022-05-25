import 'package:cloud_firestore/cloud_firestore.dart';

class CommonService {
  String content = '';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<String> get terms async {
    DocumentReference documentReference =
        _firebaseFirestore.collection('common').doc('terms');

    content = (await documentReference.get()).get('content');
    return content.replaceAll('\\n', '\n');
  }
}
