const String appAssetImageSource = 'assets/images';
const String appAssetIconSource = 'assets/icons';

const double defaultRadius = 16;

class DWalletRegex {
  static const emailRegex =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static const nameRegex = r"^[a-zA-Z '.-]*$";
  static const nameOnlyUpperCaseNoneVietnameseRegex =
      r'^((?:[A-Za-z]+ ?){1,3})$';

  static const oneUpperCase = r'(?=.*?[A-Z])';
  static const noneVietnamese = r'^[a-zA-Z0-9!@#$%^&, ]*$';
  static const oneLowerCase = r'(?=.*?[a-z])';
  static const oneDigit = r'(?=.*?[0-9])';
  static const oneSpecialCharacter = r'(?=.*?[#?!@$%^&*-])';
  static const minimumEightLength = r'.{8,}';

  static const master =
      r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))';
  static const visa = r'[4]';
  static const american = r'((506(0|1))|(507(8|9))|(6500))';
  static const discover = r'((30[0-5])|(3[89])|(36)|(3095))';
}
