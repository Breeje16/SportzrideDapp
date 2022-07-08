import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sportzride/presentation/blocs/auth_wallet/auth_wallet_cubit.dart';
import 'package:sportzride/presentation/journeys/home_screen.dart';
import 'package:sportzride/presentation/journeys/signup_signin/login_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final usernameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthWalletCubit authWalletCubit = BlocProvider.of<AuthWalletCubit>(context);

    //username field
    final usernameField = TextFormField(
        style: const TextStyle(color: Colors.white),
        autofocus: true,
        controller: usernameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Username cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          usernameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          prefixIconColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          hintText: "Username",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ));

    //email field
    final emailField = TextFormField(
        style: const TextStyle(color: Colors.white),
        autofocus: false,
        controller: emailEditingController,
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
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.white,
          ),
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
        controller: passwordEditingController,
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
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          hintText: "Password",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        style: const TextStyle(color: Colors.white),
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          hintText: "Confirm Password",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30.r),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              authWalletCubit.signup(
                usernameEditingController.text.toString(),
                emailEditingController.text.toString(),
                passwordEditingController.text.toString(),
              );
            }
          },
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
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
                      height: 180.h,
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
                        } else if (state is AuthLoaded) {
                          Fluttertoast.showToast(
                            msg: "Successfully Account Created!",
                            textColor: Colors.blue,
                            backgroundColor: Colors.white,
                          );
                        } else if (state is AuthWalletError) {
                          return Text(state.errorMessage);
                        }
                        return const SizedBox.shrink();
                      },
                      listener: (context, state) {
                        if (state is AuthWalletLoaded) {
                          Fluttertoast.showToast(
                            msg: "Your Wallet has been Created!",
                            textColor: Colors.blue,
                            backgroundColor: Colors.white,
                          );
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (route) => false);
                        }
                      },
                    ),
                    SizedBox(height: 45.h),
                    usernameField,
                    SizedBox(height: 20.h),
                    emailField,
                    SizedBox(height: 20.h),
                    passwordField,
                    SizedBox(height: 20.h),
                    confirmPasswordField,
                    SizedBox(height: 20.h),
                    signUpButton,
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            "Login",
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
}
