import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/core/utils/snackbar_utils.dart';

class AuthServices {
  /// Instance of FirebaseAuth to handle authentication.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Instance of FirebaseFirestore to interact with Firestore database.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Signs in a user using Google Sign-In.
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool result = false;
    try {
      // Initiates the Google Sign-In process.
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Retrieves the authentication details from the Google user.
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Creates a new credential using the Google authentication details.
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // Signs in the user with the created credential.
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Retrieves the signed-in user.
      User? user = userCredential.user;

      // Checks if the user is not null.
      if (user != null) {
        // If the user is signing in for the first time, save their information to Firestore.
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'uid': user.uid,
            'profilePic': user.photoURL,
          });
        }
        result = true;
      }
    } on FirebaseAuthException catch (e) {
      // Prints the error message if an exception occurs.

      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
      result = false;
    }
    return result;
  }
}
