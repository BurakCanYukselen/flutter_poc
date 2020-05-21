import 'package:flutter_poc/app_index.dart';

abstract class AbstractBlocEvent<ViewModel extends AbstractStatefulViewModel> {
  ViewModel handle(ViewModel viewModel);
}
