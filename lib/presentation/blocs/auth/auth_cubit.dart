// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sportzride/common/prefs.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> userStatus() async {
    emit(AuthLoading());
    // ignore: unrelated_type_equality_checks
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final isNewUser = await Prefs.getIsNewUser();
    if (!isNewUser && user != null) {
      emit(const AuthLoaded(username: Prefs.username, email: Prefs.email));
    } else {
      emit(AuthLogoutLoaded());
    }
  }

  Future<void> logoutUser() async {
    emit(AuthLoading());
    await FirebaseAuth.instance.signOut();
    await Prefs.clearPrefs();

    emit(
      AuthLogoutLoaded(),
    );
  }
}
