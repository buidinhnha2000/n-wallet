import 'package:intl/intl.dart';

class DWalletFormatCard {
  NumberFormat currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');

}

final dWalletFormatCard = DWalletFormatCard();