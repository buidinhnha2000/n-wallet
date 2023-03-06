import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();
  // static final RegExp emailRegex = RegExp(
  //     r'[[[A-Z0-9a-z](.?[a-z0-9]){0,30}]@([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}]');

  static final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');


  @override
  EmailValidationError? validator(String value) {
      if (value.isEmpty) {
        return EmailValidationError.empty;
      }
    //   if (emailRegex.hasMatch(value)) {
    //     return null;
    //   }
    //   return EmailValidationError.invalid;
    // }
    if( emailRegex.hasMatch(value)) {
      return null;

    }
    else {
      return EmailValidationError.invalid;
    }


  }
}
