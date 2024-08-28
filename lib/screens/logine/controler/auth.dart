import "package:cloud_firestore/cloud_firestore.dart";

import "package:firebase_auth/firebase_auth.dart";

class Auser {
  final String uid;

  Auser({required this.uid});
}

class AuthBase {
  UserCredential? userCredential;
  User? user;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> adduserdtatofirebae(
    String email,
    String password,
    String phonenum,
    String country
  ) async {
    final user = auth.currentUser;
    //get user id
    final uid = user!.uid;
    // ignore: unnecessary_null_comparison
    if (user != null) {
      try {
        await db
            .collection("order")
            .doc(uid)
            .collection("userinfo")
            .doc("usreid")
            .set({'email': email, "phonenum": country+phonenum, "uid": uid});
      } on FirebaseFirestore catch (e) {
        var errorMessage = e.toString();
        print(errorMessage);
      }
    }

    print(userCredential?.user!.email);
    if (userCredential?.user!.email == email) {
      User? user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
