import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/user_entity.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth,
        super(const AppState()) {
    _firebaseAuth.authStateChanges().listen(
          (User? user) => userState(user: user),
        );
  }
  final FirebaseAuth _firebaseAuth;

  void userState({required User? user}) {
    _firebaseAuth.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          emit(
            state.copyWith(
              user: const UserEntity(id: '', email: ''),
            ),
          );
        } else {
          emit(
            state.copyWith(
              user: UserEntity(
                id: user.uid,
                email: user.email ?? '',
              ),
            ),
          );
        }
      },
    );
  }
}
