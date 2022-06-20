import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

class ShareHelper with DateTimeMixin{
  String getUserStringForSharing(User user) {
    return 'Company Name: ${user.businessDetail!.companyName}'+
           '\nContact Person: ${user.firstName!.value} ${user.lastName?.value ?? ""}'+
           '\n\nSent from The Yarn Bazaar Mobile App - https://www.google.com';
  }

  String getYarnStringForSharing(Yarn yarn) {
    return 'Product Name: ${yarn.count} ${yarn.yarnType}'+
           '\nTime of update: ${getShortDateWithOutDayOfWeekString(yarn.updatedAt!)}'+
           '\nSeller Name: ${yarn.user!.businessDetail!.companyName}'+
           '\nSeller Location: ${yarn.user?.businessDetail?.address??"Unknown"}'+
           '\n\nSent from The Yarn Bazaar Mobile App - https://www.google.com';
  }
}

