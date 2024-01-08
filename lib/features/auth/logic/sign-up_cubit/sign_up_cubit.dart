import 'package:amazon_app/features/auth/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/register_model.dart';
import '../../data/repo/auth_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;
  SignUpCubit(this._authRepo) : super(const SignUpState.initial());

  void emitSignUpStates(RegisterModel registerModel) async {
    emit(const SignUpState.loading());
    final response = await _authRepo.signUp(registerModel);
    response.when(success: (registerModel) {
      emit(SignUpState.success(registerModel));
      debugPrint(registerModel.toJson().toString());
    }, failure: (error) {
      emit(SignUpState.error(error: error.firebaseErrorModel.message ?? ''));
    });
  }
}
