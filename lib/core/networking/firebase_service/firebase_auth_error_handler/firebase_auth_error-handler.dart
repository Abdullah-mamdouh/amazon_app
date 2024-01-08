
import 'package:amazon_app/core/networking/firebase_service/firebase_constant.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../api_error_model.dart';

enum AuthResultStatus {

  ERROR_INVALID_EMAIL,
  ERROR_WRONG_PASSWORD,
  ERROR_USER_NOT_FOUND,
  ERROR_USER_DISABLED,
  ERROR_TOO_MANY_REQUESTS,
  ERROR_OPERATION_NOT_ALLOWED,
  ERROR_EMAIL_ALREADY_IN_USE,
  UNDIFIEND,
  ////////////////////////////////////
  // successful,
  // emailAlreadyExists,
  // wrongPassword,
  // invalidEmail,
  // userNotFound,
  // userDisabled,
  // operationNotAllowed,
  // tooManyRequests,
  // undefined,
}

class ResponseMessage {
  static const String INVALID_EMAIL =
      FirebaseErrors.invalidEmail;
  static const String EMAIL_ALREADY_EXISTS =
      FirebaseErrors.emailAlreadyExists;
  static const String WRONG_PASSWORD =
      FirebaseErrors.wrongPassword;
  static const String USER_NOT_FOUND =
      FirebaseErrors.userNotFound;
  static const String USER_DISABLED =
      FirebaseErrors.userDisabled;
  static const String TOO_MANY_REGUSTES =
      FirebaseErrors.tooManyRequests;
  static const String OPERATION_NOT_ALLOWED =
      FirebaseErrors.operationNotAllowed;
  static const String UNDIFIEND =
      FirebaseErrors.undefined;
}

extension AuthExceptionHandler on AuthResultStatus {
  ApiErrorModel getFailure() {
    //print(e.code);
    //var status;
    switch (this) {
      case AuthResultStatus.ERROR_INVALID_EMAIL:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.INVALID_EMAIL);
      case AuthResultStatus.ERROR_WRONG_PASSWORD:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.WRONG_PASSWORD);
      case AuthResultStatus.ERROR_USER_NOT_FOUND:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.USER_NOT_FOUND);
      case AuthResultStatus.ERROR_USER_DISABLED:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.USER_DISABLED);
      case AuthResultStatus.ERROR_TOO_MANY_REQUESTS:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.TOO_MANY_REGUSTES);
      case AuthResultStatus.ERROR_OPERATION_NOT_ALLOWED:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.OPERATION_NOT_ALLOWED);
      case AuthResultStatus.ERROR_EMAIL_ALREADY_IN_USE:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.EMAIL_ALREADY_EXISTS);
      case AuthResultStatus.UNDIFIEND:
        return ApiErrorModel(
            code: 0, message: ResponseMessage.UNDIFIEND);
      // default:
      //   return ApiErrorModel(
      //       code: 0, message: ResponseMessage.UNDIFIEND);
        //status = AuthResultStatus.undefined;
    }
  }

}

class ErrorHandler implements Exception {
  late ApiErrorModel firebaseErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is FirebaseException) {
      // dio error so its an error from response of the API or from dio itself
      firebaseErrorModel = _handleError(error);
    } else {
      // default error
      firebaseErrorModel = AuthResultStatus.UNDIFIEND.getFailure();
    }
  }
}

ApiErrorModel _handleError( FirebaseException error) {
  switch (error.code) {
    case 'ERROR_INVALID_EMAIL':
      return AuthResultStatus.ERROR_INVALID_EMAIL.getFailure();
    case "ERROR_WRONG_PASSWORD":
      return AuthResultStatus.ERROR_WRONG_PASSWORD.getFailure();
    case "ERROR_USER_NOT_FOUND":
      return AuthResultStatus.ERROR_USER_NOT_FOUND.getFailure();
    case "ERROR_USER_DISABLED":
      return AuthResultStatus.ERROR_USER_DISABLED.getFailure();
    case "ERROR_TOO_MANY_REQUESTS":
        return AuthResultStatus.ERROR_TOO_MANY_REQUESTS.getFailure();
    case "ERROR_OPERATION_NOT_ALLOWED":
      return AuthResultStatus.ERROR_OPERATION_NOT_ALLOWED.getFailure();
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return AuthResultStatus.ERROR_EMAIL_ALREADY_IN_USE.getFailure();
    default:
      return AuthResultStatus.UNDIFIEND.getFailure();
  }
}
