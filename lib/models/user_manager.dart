import 'package:flutter/services.dart';
import 'package:loja_virtual_pro/helpers/firebase_errors.dart';
import 'package:loja_virtual_pro/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  Future<void> signIn({User user, Function onFail, Function onSucess}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      //print(result.user.uid);
      onSucess();
    } on PlatformException catch (e) {
      //print(getErrorString(e.code));
      onFail(getErrorString(e.code));
    }
  }

  void setLoading(bool value) {
    loading = value;
  }
}
