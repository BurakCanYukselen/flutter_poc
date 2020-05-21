import 'package:flutter_poc/app_index.dart';

class POCStatefulViewModel extends AbstractStatefulViewModel {
  String title = "This is Statefull MVC View";
  int count = 0;

  double get fontSize => 20;
  TextStyle get textStyle => TextStyle(fontSize: this.fontSize);
}

class POCBlocEvent extends AbstractBlocEvent<POCStatefulViewModel> {
  @override
  POCStatefulViewModel handle(POCStatefulViewModel viewModel) {
    viewModel.count++;
    return viewModel;
  }
}

class POCStatefulController
    extends AbstractStatefulController<POCStatefulViewModel, POCBlocEvent> {
  POCStatefulController() : super(POCStatefulViewModel());

  Widget get view => Center(
        child: Container(
          child: this._viewBundle,
        ),
      );

  Widget get _viewBundle => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [this._title, this._counter, this._button],
      );

  Widget get _title => Text(
        this.viewModel.title,
        style: this.viewModel.textStyle,
      );
  Widget get _counter => this.stremReader((viewModel) => Text(
        "Counter: ${this.viewModel.count}",
        style: this.viewModel.textStyle,
      ));
  Widget get _button => FloatingActionButton(
        onPressed: () => this.callEvent(POCBlocEvent()),
        child: Text("+"),
      );
}

class _POCStatefulViewState
    extends AbstractStatefulViewState<POCStatefulController> {
  _POCStatefulViewState() : super(POCStatefulController());

  @override
  Widget internalBuild(BuildContext context) {
    return this.controller.view;
  }
}

class POCStatefulView extends AbstractStatefulView {
  POCStatefulView() : super(_POCStatefulViewState());
}
