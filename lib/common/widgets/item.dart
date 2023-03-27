import '../../navigation/navigation.dart';
import '../assets/app_assets.dart';

const List<ActionMainHome> actionMainHome = [
  ActionMainHome(AppAssets.iconTransfer, 'Transfer', AppRoutes.transferBalance),
  ActionMainHome(AppAssets.iconTopup, 'Deposit', AppRoutes.depositSelectMethod),
  ActionMainHome(AppAssets.iconHistory, 'History', AppRoutes.home),
];

class ActionMainHome {
  final String img;
  final String text;
  final String route;
  const ActionMainHome(this.img, this.text, this.route);
}

const List<PaymentItem> itemPaymentList = [
  PaymentItem(AppAssets.iconElectricity, 'Electricity'),
  PaymentItem(AppAssets.iconInternet, 'Internet'),
  PaymentItem(AppAssets.iconVoucher, 'Voucher'),
  PaymentItem(AppAssets.iconAssurance, 'Assurance'),
  PaymentItem(AppAssets.iconMerchant, 'Merchant'),
  PaymentItem(AppAssets.iconMobileCredit, 'Mobile Credit'),
  PaymentItem(AppAssets.iconBill, 'Bill'),
  PaymentItem(AppAssets.iconMore, 'More'),
];

class PaymentItem {
  final String img;
  final String text;
  const PaymentItem(this.img, this.text);
}

const List<ProfileSettingItem> itemProfileSetting = [
  ProfileSettingItem(AppAssets.iconPerson, 'Personal', AppRoutes.home),
  ProfileSettingItem(AppAssets.iconPrivacy, 'Privacy & Security', AppRoutes.home),
  ProfileSettingItem(AppAssets.iconOffers, 'Offers & Rewards', AppRoutes.home),
  ProfileSettingItem(AppAssets.iconHelp, 'Help', AppRoutes.home),
  ProfileSettingItem(AppAssets.iconLogout, 'Logout', AppRoutes.signOption),
];

class ProfileSettingItem {
  final String img;
  final String text;
  final String route;
  const ProfileSettingItem(this.img, this.text, this.route);
}
