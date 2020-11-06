// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// String name;
// String imageUrl;

// Future<String> signInWithGoogle() async {
//   await Firebase.initializeApp();
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken);
//   final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//   final User user = authResult.user;

//   if (user != null) {
//     assert(user.displayName != null);
//     assert(user.photoURL != null);

//     if (name.contains(" ")) {
//       name = name.substring(0, name.indexOf(" "));
//     }
//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);
//     final User currentUser = _auth.currentUser;
//     assert(user.uid == currentUser.uid);

//     print("SignInWIthGoogle succedd: $user");

//     return '$user';
//   }

//   return null;
// }

// Future<void> signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Signed Out");
// }

// // class AuthHelper {
// //   static FirebaseAuth _auth = FirebaseAuth.instance;
// //   static signInWithEmail({String email, String password}) async {
// //     final res = await _auth.signInWithEmailAndPassword(
// //         email: email, password: password);
// //     final User user = res.user;
// //     return user;
// //   }

// //   static signInWithGoogle() async {
// //     GoogleSignIn googleSignIn = GoogleSignIn();
// //     final acc = await googleSignIn.signIn();
// //     final auth = await acc.authentication;
// //     final credential = GoogleAuthProvider.credential(
// //         accessToken: auth.accessToken, idToken: auth.idToken);
// //     final res = await _auth.signInWithCredential(credential);
// //     return res.user;
// //   }

// //   static logOut() {
// //     GoogleSignIn().signOut();
// //     return _auth.signOut();
// //   }
// // }
