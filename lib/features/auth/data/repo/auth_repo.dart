import 'package:amazon_app/core/networking/firebase_service/firebase_service.dart';
import 'package:amazon_app/features/auth/data/models/auth_user_model.dart';
import 'package:amazon_app/features/auth/data/models/login_model.dart';
import 'package:amazon_app/features/auth/data/models/register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';
import '../../../../core/networking/firebase_service/firebase_result.dart';

class AuthRepo  extends FirebaseAuthService{
  final FirebaseAuth auth ;

  AuthRepo(this.auth);
  @override
  Future<FirebaseResult<AuthUserModel>> signIn(LoginModel loginModel) async{
    try{
            final UserCredential response = await auth.signInWithEmailAndPassword(
              email: loginModel.email,
              password: loginModel.password,
            );

            return FirebaseResult.success(AuthUserModel.fromJson(response.user as Map<String, dynamic>));
          } catch (errro) {
            return FirebaseResult.failure(ErrorHandler.handle(errro) );
          }

  }

  @override
  Future<FirebaseResult<void>> signOut() async{
    try {
     final response =  await auth.signOut();
     return FirebaseResult.success(response);
    } catch (error) {
      return FirebaseResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<FirebaseResult<AuthUserModel>> signUp(RegisterModel registerModel) async{
    try{
      final UserCredential response = await auth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );

      return FirebaseResult.success(AuthUserModel.fromJson(response.user as Map<String, dynamic>));
    } catch (errro) {
      return FirebaseResult.failure(ErrorHandler.handle(errro) );
    }
  }
}
