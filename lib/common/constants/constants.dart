const String appAssetImageSource = 'assets/images';
const String appAssetIconSource = 'assets/icons';

const double defaultRadius = 16;

class DWalletRegex {
  static const emailRegex =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static const nameRegex =
      r'^^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$';

  static const oneUpperCase = r'(?=.*?[A-Z])';
  static const noneVietnamese = r'^[a-zA-Z0-9!@#$%^&, ]*$';
  static const oneLowerCase = r'(?=.*?[a-z])';
  static const oneDigit = r'(?=.*?[0-9])';
  static const oneSpecialCharacter = r'(?=.*?[#?!@$%^&*-])';
  static const minimumEightLength = r'.{8,}';
}
