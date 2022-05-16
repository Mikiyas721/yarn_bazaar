import 'package:yarn_bazaar/common/view_model.dart';

class ComposedYarnViewModel extends ViewModel {
  final bool isAdding;

  ComposedYarnViewModel({
    required this.isAdding,
  });

  @override
  List<Object?> get props => [
        isAdding,
      ];
}
