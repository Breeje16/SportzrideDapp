import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportzride/common/prefs.dart';
import 'package:sportzride/common/services/wallet_creation.dart';
import 'package:sportzride/data/models/wallet_model.dart';

part 'auth_wallet_state.dart';

class AuthWalletCubit extends Cubit<AuthWalletState> {
  AuthWalletCubit() : super(AuthWalletInitial());

  Future<void> signup(String username, String email, String password) async {
    emit(AuthWalletLoading());

    final auth = FirebaseAuth.instance;

    String? errorMessage;

    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(username, email)})
          .catchError((e) {});
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";

          emit(AuthWalletError(errorMessage));
      }
    }

    // Fluttertoast.showToast(msg: errorMessage!);
  }

  postDetailsToFirestore(String username, String email) async {
    // calling our firestore
    // calling our user model
    // sending these values
    final auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    WalletModel walletModel = WalletModel();
    WalletAddress service = WalletAddress();
    final mnemonic = service.generateMnemonic();
    final privateKey = await service.getPrivateKey(mnemonic);
    final pubKey = await service.getPublicKey(privateKey);
    // privAddress = privateKey;
    // pubAddress = publicKey.toString();
    // addUserDetails(privateKey, publicKey);

    // writing all the values
    walletModel.email = user!.email;
    walletModel.userId = user.uid;
    walletModel.username = username;
    walletModel.mnemonic = mnemonic;
    walletModel.privateKey = privateKey;
    walletModel.publicKey = pubKey.toString();

    await firebaseFirestore
        .collection("wallets")
        .doc(user.uid)
        .set(walletModel.toMap());

    emit(AuthLoaded());
    // Fluttertoast.showToast(msg: "Account created successfully :) ");

    Prefs.setIsNewUser(false);
    Prefs.setUserId(walletModel.userId);
    Prefs.setUserName(walletModel.username!);
    Prefs.setMnemonic(walletModel.mnemonic!);
    Prefs.setPrivateKey(walletModel.privateKey!);
    Prefs.setPublicKey(walletModel.publicKey.toString());
    Prefs.setEmail(walletModel.email!);

    emit(AuthWalletLoaded());
  }

  Future<void> login(String email, String password) async {
    emit(AuthWalletLoading());

    final auth = FirebaseAuth.instance;

    String? errorMessage;

    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {getDetailsFromFirestore(email, password)});
      //   Fluttertoast.showToast(msg: "Login Successful"),
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       builder: (context) => const HomeScreen())),
      // });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          emit(AuthWalletError(errorMessage));
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          emit(AuthWalletError(errorMessage));
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          emit(AuthWalletError(errorMessage));
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          emit(AuthWalletError(errorMessage));
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          emit(AuthWalletError(errorMessage));
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          emit(AuthWalletError(errorMessage));
          break;
        default:
          errorMessage = "An undefined Error happened.";
          emit(AuthWalletError(errorMessage));
      }

      // Fluttertoast.showToast(msg: errorMessage!);
    }
  }

  getDetailsFromFirestore(String username, String email) async {
    final auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    WalletModel walletModel = WalletModel();
    // privAddress = privateKey;
    // pubAddress = publicKey.toString();
    // addUserDetails(privateKey, publicKey);

    // writing all the values

    await firebaseFirestore
        .collection('wallets')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        walletModel.address = documentSnapshot['address'];
        walletModel.publicKey = documentSnapshot['public_key'];
        walletModel.privateKey = documentSnapshot['private_key'];
        walletModel.username = documentSnapshot['username'];
        walletModel.userId = documentSnapshot['userId'];
        walletModel.mnemonic = documentSnapshot['mnemonic'];
        walletModel.email = documentSnapshot['email'];
      } else {}
    });

    emit(AuthLoaded());
    // Fluttertoast.showToast(msg: "Account created successfully :) ");

    // Prefs.setIsNewUser(false);
    // Prefs.setUserId(walletModel.userId);
    // Prefs.setUserName(walletModel.username!);
    // Prefs.setMnemonic(walletModel.mnemonic!);
    // Prefs.setPrivateKey(walletModel.privateKey!);
    // Prefs.setPublicKey(walletModel.publicKey.toString());
    // Prefs.setEmail(walletModel.email!);

    Prefs.setAddress(walletModel.address.toString());
    Prefs.setIsNewUser(false);
    Prefs.setEmail(walletModel.email.toString());
    Prefs.setMnemonic(walletModel.mnemonic.toString());
    Prefs.setPrivateKey(walletModel.privateKey.toString());
    Prefs.setPublicKey(walletModel.publicKey.toString());
    Prefs.setUserId(walletModel.userId.toString());
    Prefs.setUserName(walletModel.username.toString());

    emit(AuthWalletLoaded());
  }
}
