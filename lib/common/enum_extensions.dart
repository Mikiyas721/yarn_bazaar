import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_categories.dart';
import 'package:yarn_bazaar/domain/value_objects/yarn_requirement_intention.dart';

extension EnumItemIndexExtension on num{
  UserType get getUserType{
    if(this==0) return UserType.yarn_manufacturer;
    else if(this==1) return UserType.yarn_trader;
    else if(this==2) return UserType.fabric_manufacturer;
    else return UserType.other;
  }

  YarnRequirementIntention get getIntention{
    if(this==0) return YarnRequirementIntention.PriceInquiry;
    else if(this==1) return YarnRequirementIntention.Purchase;
    else return YarnRequirementIntention.None;
  }
}

extension YarnCategoriesExtensions on YarnCategories{
  String getString(){
    if (this==YarnCategories.Cotton) return "Cotton";
    else if (this==YarnCategories.Texturise) return "Texturise";
    else if (this==YarnCategories.PSF) return "PSF";
    else if (this==YarnCategories.PC) return "PC";
    else if (this==YarnCategories.PV) return "PV";
    else if (this==YarnCategories.Viscose) return "Viscose";
    else if (this==YarnCategories.CP) return "CP";
    else if (this==YarnCategories.Linen) return "Linen";
    else if (this==YarnCategories.Modal) return "Modal";
    else if (this==YarnCategories.Rayon) return "Rayon";
    else if (this==YarnCategories.Fancy) return "Fancy";
    else if (this==YarnCategories.WorstedWool) return "WorstedWool";
    else throw Exception("Unknown Yarn Category");
  }
}

extension YarnRequirementIntentionExtension on YarnRequirementIntention{
  String getString(){
    if (this==YarnRequirementIntention.PriceInquiry) return "Price Inquiry";
    else if (this==YarnRequirementIntention.Purchase) return "Purchase";
    else if (this==YarnRequirementIntention.None) return "None";
    else throw Exception("Unknown Yarn Intention");
  }
}