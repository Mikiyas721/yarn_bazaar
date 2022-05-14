import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/presentation/models/edit_basic_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/stacked_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class EditBasicProfileView extends StatelessWidget {
  final EditBasicProfileViewModel editBasicProfileViewModel;
  final Function(String firstName) onFirstName;
  final Function(String lastName) onLastName;
  final Function(String inBusinessSince) onInBusinessSince;
  final VoidCallback onPhoneNumber;
  final VoidCallback onCountry;
  final VoidCallback onCity;
  final Function(String email) onEmail;
  final Function(String website) onWebsite;
  final VoidCallback onSave;
  final VoidCallback onReload;
  final TextEditingController? firstNameTextEditingController;
  final TextEditingController? lastNameTextEditingController;
  final TextEditingController? inBusinessSinceTextEditingController;
  final TextEditingController? primaryNumberTextEditingController;
  final TextEditingController? countryTextEditingController;
  final TextEditingController? cityTextEditingController;
  final TextEditingController? emailTextEditingController;
  final TextEditingController? websiteTextEditingController;

  const EditBasicProfileView({
    Key? key,
    required this.editBasicProfileViewModel,
    required this.onFirstName,
    required this.onLastName,
    required this.onInBusinessSince,
    required this.onPhoneNumber,
    required this.onCountry,
    required this.onCity,
    required this.onEmail,
    required this.onWebsite,
    required this.onSave,
    required this.onReload,
    this.firstNameTextEditingController,
    this.lastNameTextEditingController,
    this.inBusinessSinceTextEditingController,
    this.primaryNumberTextEditingController,
    this.countryTextEditingController,
    this.cityTextEditingController,
    this.emailTextEditingController,
    this.websiteTextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFieldWithTitle(
                    title: 'First Name',
                    controller: firstNameTextEditingController,
                    errorMessage: editBasicProfileViewModel.firstNameError,
                    hintText: 'John',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onFirstName,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Last Name',
                    controller: lastNameTextEditingController,
                    errorMessage: editBasicProfileViewModel.lastNameError,
                    hintText: 'Williams',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onLastName,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'In Business Since',
                    controller: inBusinessSinceTextEditingController,
                    errorMessage: editBasicProfileViewModel.inBusinessSinceError,
                    keyboardType: TextInputType.number,
                    hintText: '1995',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onInBusinessSince,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Primary Number',
                    readOnly: true,
                    enabled: false,
                    controller: primaryNumberTextEditingController,
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onTap: onPhoneNumber,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Country',
                    readOnly: true,
                    enabled: false,
                    controller: countryTextEditingController,
                    hintText: 'India',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onTap: onCountry,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'City',
                    readOnly: true,
                    enabled: false,
                    controller: cityTextEditingController,
                    hintText: 'Addis',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onTap: onCity,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Email',
                    controller: emailTextEditingController,
                    errorMessage: editBasicProfileViewModel.emailError,
                    hintText: 'xyz123@gmail.com',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onEmail,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Website',
                    controller: websiteTextEditingController,
                    errorMessage: editBasicProfileViewModel.websiteError,
                    hintText: 'https://www.xyz.com',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onWebsite,
                  ),
                  60.vSpace
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: MyActionButton(
              label: 'SAVE',
              onSubmit: onSave,
              isLoading: editBasicProfileViewModel.isSaving,
            )),
        MyStackedLoadingView(
          isLoading: editBasicProfileViewModel.isLoadingSaved,
          error: editBasicProfileViewModel.error,
          onReload: onReload,
        )
      ],
    );
  }
}
