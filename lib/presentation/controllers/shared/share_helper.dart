import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

class ShareHelper with DateTimeMixin{
  String getUserStringForSharing(User user) {
    return '''
  Company Name: ${user.businessDetail!.companyName}
  Contact Person: ${user.firstName!.value} ${user.lastName?.value ?? ""}
  
  Sent from The Yarn Bazaar Mobile App - https://www.google.com
  ''';
  }

  String getYarnStringForSharing(Yarn yarn) {
    return '''
  Product Name: ${yarn.count} ${yarn.yarnType}
  Time of update: ${getShortDateWithOutDayOfWeekString(yarn.updatedAt!)}
  Seller Name: ${yarn.user!.businessDetail!.companyName}
  Seller Location: ${yarn.user?.businessDetail?.address??"Unknown"}
  
  Sent from The Yarn Bazaar Mobile App - https://www.google.com
  ''';
  }
}

