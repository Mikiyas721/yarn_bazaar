import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/edit_basic_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_basic_profile_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditBasicProfilePage extends StatelessWidget {
  const EditBasicProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: const Text('Edit Basic Profile'),
      ),
      body: EditBasicProfileView(
        editBasicProfileViewModel: EditBasicProfileViewModel.defaults(),
        onFirstName: (String firstName){},
        onLastName: (String lastName){},
        onInBusinessSince: (String inBusinessSince){},
        onPhoneNumber: (){},
        onCountry: (){},
        onCity: (){},
        onEmail: (String email){},
        onWebsite: (String website){},
        onSave: (){},
      ),
    );
  }
}
