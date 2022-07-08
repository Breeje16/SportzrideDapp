import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void addUserDetails(privateKey, publicKey) async {
  var userInstance = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection("wallets")
      .doc(userInstance!.uid)
      .set({
        'username': userInstance.displayName,
        'privatekey': privateKey.toString(),
        'publickey': publicKey.toString(),
        'wallet_created': true
      })
      .whenComplete(() => {})
      .catchError((error) {});
}

Future<dynamic> getUserDetails() async {
  dynamic data;
  var userInstance = FirebaseAuth.instance.currentUser;
  final DocumentReference document =
      FirebaseFirestore.instance.collection("wallets").doc(userInstance!.uid);
  await document.get().then<dynamic>((DocumentSnapshot snapshot) {
    data = snapshot.data();
  });
  return data;
}
