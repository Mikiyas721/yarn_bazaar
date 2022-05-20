import 'package:yarn_bazaar/common/mixins/formatter_mixin.dart';
import 'package:yarn_bazaar/common/view_model.dart';

class SellerViewModel extends ViewModel with FormatterMixin {
  final String companyName;
  final String location;
  final String lastUpdated;
  final String sellerType;

  SellerViewModel({
    required this.companyName,
    required this.location,
    required this.lastUpdated,
    required this.sellerType,
  });

  @override
  List<Object?> get props => [
        companyName,
        location,
        lastUpdated,
        sellerType,
      ];

  String get initials {
    return getInitials(companyName);
  }
}
