import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

   Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(error: 'no user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(error: 'wrong password provided for that user'));
      }
    } catch (e) {
      emit(LoginFailure(error: 'there was an erorr'));
    }
  }



  
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailer(error: 'the password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailer(
            error: 'the account is already exists for that email'));
      }
    } catch (e) {
      emit(RegisterFailer(error: 'there was an erorr'));
    }
  }


  @override 
  void onChange(Change<AuthState> change) {

    super.onChange(change);

    print(change);
  }

}
