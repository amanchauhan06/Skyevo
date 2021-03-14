import 'package:firebase_auth/firebase_auth.dart';

class Auth {

final FirebaseAuth auth = FirebaseAuth.instance;

Future<dynamic> handleSignInEmail(String email, String password) async {
  try {
    var result = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;
    if(user!=null){
      final User currentUser = auth.currentUser;
      if (user.uid == currentUser.uid) {
        print('signInEmail succeeded: $user');
        return true;
    }
      else{
        return 'Authentication Failed';
      }

    }
  }catch(error){
    return error;
  }
}
Future<dynamic> handleSignUp(email, password) async {
try{
  var result = await auth.createUserWithEmailAndPassword(email: email, password: password);
  final user = result.user;

  assert (user != null);
  assert (await user.getIdToken() != null);

  return true;

}
catch(error){
  return error;
}

}

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }


}