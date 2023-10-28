import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google sign in
  Future<User?> signInWithGoogle() async {
    // begin interatice sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    User? user;

    // obtain authentication details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential from user
    final credential = GoogleAuthProvider.credential(
        idToken: gAuth.idToken, accessToken: gAuth.accessToken);

    // finally, sign in
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    user = userCredential.user;
    return user;
  }
}
