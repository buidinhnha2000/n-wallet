const String appAssetImageSource = 'assets/images';
const String appAssetIconSource = 'assets/icons';

const double defaultRadius = 16;

class EmailRegex {
  static final emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
}

class NameRegex {
  static final RegExp nameRegex = RegExp(
      r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)");
}

class PasswordRegex {
  static final RegExp oneUpperCase = RegExp(r'(?=.*?[A-Z])');
  static final RegExp oneLowerCase = RegExp(r'(?=.*?[a-z])');
  static final RegExp oneDigit = RegExp(r'(?=.*?[0-9])');
  static final RegExp oneSpecialCharacter = RegExp(r'(?=.*?[#?!@$%^&*-])');
  static final RegExp minimumEightLength = RegExp(r'.{8,}');
}
