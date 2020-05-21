import 'package:flutter_poc/app_index.dart';

abstract class AbstractStatefulView extends StatefulWidget {
  final AbstractStatefulViewState _state;
  AbstractStatefulView(this._state);

  @override
  State<AbstractStatefulView> createState() => this._state;
}

abstract class AbstractStatefulViewState<
        Controller extends AbstractStatefulController>
    extends State<AbstractStatefulView> {
  final Controller controller;

  AbstractStatefulViewState(this.controller);

  @override
  Widget build(BuildContext context) {
    this.controller.setCurrentContext(context);
    return internalBuild(context);
  }

  @override
  void dispose() { 
    super.dispose();
    this.controller.disposeStreamController();
  }

  Widget internalBuild(BuildContext context);
}
