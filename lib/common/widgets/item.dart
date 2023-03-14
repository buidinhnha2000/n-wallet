
import '../assets/app_assets.dart';

const List<ActionMainHome> actionMainHome = [
  ActionMainHome(AppAssets.iconTransfer, 'Transfer'),
  ActionMainHome(AppAssets.iconTopup, 'Top Up'),
  ActionMainHome(AppAssets.iconHistory, 'History'),
];

class ActionMainHome {
  final String img;
  final String text;
  const ActionMainHome(this.img, this.text);
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