import 'package:intl/intl.dart';

String formatPrice(int price) {
  final NumberFormat formatter = NumberFormat.decimalPattern('es');
  return '\$ ${formatter.format(price)}';
}
