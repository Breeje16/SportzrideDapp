import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sportzride/presentation/blocs/auth_wallet/auth_wallet_cubit.dart';
import 'package:sportzride/presentation/journeys/home_screen.dart';
import 'package:sportzride/presentation/journeys/signup_signin/signup_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthWalletCubit authWalletCubit;
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    authWalletCubit = BlocProvider.of<AuthWalletCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        style: const TextStyle(color: Colors.white),
        autofocus: true,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.white,
          ),
          prefixIconColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          hintText: "Email",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        style: const TextStyle(color: Colors.white),
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          prefixIconColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          hintText: "Password",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30.r),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            authWalletCubit.login(
              emailController.text.toString(),
              passwordController.text.toString(),
            );
          }
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: AppTheme.bgMain,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 36.h),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200.h,
                      child: Image.asset(
                        "assets/icons/sportzride.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    BlocConsumer<AuthWalletCubit, AuthWalletState>(
                      builder: (context, state) {
                        if (state is AuthWalletLoading) {
                          return const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          );
                        } else if (state is AuthWalletError) {
                          return Text(
                            state.errorMessage,
                            style: const TextStyle(color: Colors.red),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      listener: (context, state) {
                        if (state is AuthWalletLoaded) {
                          Fluttertoast.showToast(msg: "Login Successful");
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (route) => false);
                        }
                      },
                    ),
                    SizedBox(height: 45.h),
                    emailField,
                    SizedBox(height: 25.h),
                    passwordField,
                    SizedBox(height: 35.h),
                    loginButton,
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen())),
                });
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
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }
}
