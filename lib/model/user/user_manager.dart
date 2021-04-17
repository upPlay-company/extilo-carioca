import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/helpers/firebase.error.dart';
import 'package:extilo_carioca/model/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserUser user;

  List<UserUser> allUser = [];

  bool _loading = false;

  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  bool _loadingFacebook = false;
  bool get loadingFacebook => _loadingFacebook;
  set loadingFacebook(bool value) {
    _loadingFacebook = value;
    notifyListeners();
  }

  Future<void> signIn(
      {UserUser user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await _loadCurrentUser(firebaseUser: result.user);

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
      print(e);
    }

    loading = false;
  }

  Future<void> signUp(
      {UserUser user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      user.id = result.user.uid;
      this.user = user;

      await user.saveData();

      user.saveToken();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
      print(e);
    }
    loading = false;
  }

  Future<void> facebookLogin({Function onFail, Function onSuccess}) async {
    loadingFacebook = true;

    final result = await FacebookLogin().logIn(['email', 'public_profile']);

    switch(result.status){
      case FacebookLoginStatus.loggedIn:
        final credential = FacebookAuthProvider.credential(
            result.accessToken.token
        );

        final authResult = await auth.signInWithCredential(credential);

        if(authResult != null){
          final firebaseUser = authResult.user;

          user = UserUser(
              id: firebaseUser.uid,
              name: firebaseUser.displayName,
              email: firebaseUser.email
          );

          await user.saveData();

          user.saveToken();

          onSuccess();
        }
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        onFail(result.errorMessage);
        break;
    }
    loadingFacebook = false;
  }

  void signOut() {
    auth.signOut();
    user = null;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User firebaseUser}) async {
    final User currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').doc(currentUser.uid).get();
      user = UserUser.fromDocument(docUser);

      user.saveToken();
      notifyListeners();
    }
  }

  void update(UserUser user) {
    allUser.removeWhere((u) => u.id == user.id);
    allUser.add(user);
    notifyListeners();
  }

  void recoverPass(String email) {
    auth.sendPasswordResetEmail(email: email);
  }

  void newPass(String newPassword) {
    auth.currentUser.updatePassword(newPassword);
  }
}
