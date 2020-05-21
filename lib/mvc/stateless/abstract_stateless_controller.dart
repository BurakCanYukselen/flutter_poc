import 'package:flutter_poc/app_index.dart';

abstract class AbstractStatelessController<ViewModel extends AbstractStatelessViewModel> {
  final ViewModel viewModel;

  AbstractStatelessController(this.viewModel);

  void setCurrentContext(BuildContext context) {
    this.viewModel.context = context;
  }
}
