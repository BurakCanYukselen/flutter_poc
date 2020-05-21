import 'package:flutter_poc/app_index.dart';

class POCStatelessViewModel extends AbstractStatelessViewModel {
  String text = "This is Stateless MVC View";
}

class POCStatelessController
    extends AbstractStatelessController<POCStatelessViewModel> {
  POCStatelessController() : super(POCStatelessViewModel());

  Widget get view => Center(
        child: Text(
          this.viewModel.text,
          style: TextStyle(fontSize: 20),
        ),
      );
}

class POCStatelessView extends AbstractStatelessView<POCStatelessController> {
  POCStatelessView() : super(POCStatelessController());

  @override
  Widget internalBuild(BuildContext context) {
    return this.controller.view;
  }
}
