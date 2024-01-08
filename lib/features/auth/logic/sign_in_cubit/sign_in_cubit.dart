import 'package:amazon_app/features/auth/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/register_model.dart';
import '../../data/repo/auth_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo _authRepo;
  SignInCubit(this._authRepo) : super(const SignInState.initial());
  
  void emitSignInStates(RegisterModel registerModel) async {
    emit(const SignInState.loading());
    final response = await _authRepo.signUp(registerModel);
    response.when(success: (registerModel) {
      emit(SignInState.success(registerModel));
      debugPrint(registerModel.toJson().toString());
    }, failure: (error) {
      emit(SignInState.error(error: error.firebaseErrorModel.message ?? ''));
    });
  }
}
