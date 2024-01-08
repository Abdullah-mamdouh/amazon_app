

import 'package:amazon_app/features/auth/data/models/auth_user_model.dart';
import 'package:amazon_app/features/auth/data/models/login_model.dart';
import 'package:amazon_app/features/auth/data/models/register_model.dart';

import 'firebase_result.dart';
abstract class FirebaseAuthService {
// Single Responsibility: Each Repository has a single responsibility,
// which is to provide data for a specific type of entity.
  //Stream<AuthUserModel> get authUser;

  Future<FirebaseResult<AuthUserModel>> signUp(RegisterModel registerModel);

  Future<FirebaseResult<AuthUserModel>> signIn(LoginModel loginModel);

  Future<FirebaseResult<void>> signOut();
}