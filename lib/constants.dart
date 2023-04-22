import 'package:intl/intl.dart';

formatDate(DateTime? date) {
  return DateFormat('d/ MMM/ yyyy').format(date!);
}
