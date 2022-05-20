import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/use_cases/add_yarn_requirement.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/composed_yarn_view_model.dart';
import 'package:yarn_bazaar/application/composed_yarn/composed_yarn_bloc.dart';

class ComposedYarnController extends BlocViewModelController<
    ComposedYarnBloc,
    ComposedYarnEvent,
    ComposedYarnState,
    ComposedYarnViewModel> with ShortMessageMixin, DateTimeMixin {
  final Yarn yarn;
  final intentionTextEditingController = TextEditingController();
  final yarnQualityTextEditingController = TextEditingController();
  final qualityDetailsTextEditingController = TextEditingController();
  final colourTextEditingController = TextEditingController();
  final quantityInKgsTextEditingController = TextEditingController();
  final deliveryAreaTextEditingController = TextEditingController();
  final deliveryPeriodTextEditingController = TextEditingController();
  final paymentTermsTextEditingController = TextEditingController();
  final inquiryClosesWithInTextEditingController = TextEditingController();
  final sendRequirementToTextEditingController = TextEditingController();
  final additionalCommentsTextEditingController = TextEditingController();

  ComposedYarnController(BuildContext context, this.yarn)
      : super(context, getIt.get<ComposedYarnBloc>(), true);

  @override
  ComposedYarnViewModel mapStateToViewModel(ComposedYarnState s) {
    return ComposedYarnViewModel(
      isAdding: s.isAdding,
    );
  }

  fillTextFields() {
    intentionTextEditingController.text = yarn.intention;
    yarnQualityTextEditingController.text = '${yarn.count} ${yarn.yarnType} ${yarn.purpose}';
    if (yarn.qualityDetails != null)
      qualityDetailsTextEditingController.text = yarn.qualityDetails!;
    colourTextEditingController.text = yarn.colour;
    quantityInKgsTextEditingController.text = yarn.quantityInKgs.value.toString();
    deliveryAreaTextEditingController.text = yarn.deliveryArea.value;
    deliveryPeriodTextEditingController.text = yarn.deliveryPeriod;
    paymentTermsTextEditingController.text = yarn.paymentTerms.value;
    inquiryClosesWithInTextEditingController.text = yarn.inquiryClosesWithIn.toString();
    sendRequirementToTextEditingController.text = yarn.sendRequirementTo;
    if(yarn.additionalComments!=null)
      additionalCommentsTextEditingController.text = yarn.additionalComments!;
  }

  onPostYarn() async {
    bloc.add(ComposedYarnStartedAddingEvent());
    final response = await getIt.get<AddYarnRequirement>().execute(yarn);
    response.fold((l) {
      bloc.add(ComposedYarnStoppedAddingEvent());
      toastError(l.message);
    }, (r) async {
      bloc.add(ComposedYarnStoppedAddingEvent());
      toastSuccess("Successfully added");
      await delay(seconds: 1);
      Navigator.pop(context);
    });
  }
}
