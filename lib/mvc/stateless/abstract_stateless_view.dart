import 'package:flutter_poc/app_index.dart';

abstract class AbstractStatelessView<Controller extends AbstractStatelessController> extends StatelessWidget{
  final Controller controller;
  AbstractStatelessView(this.controller);

  @override
  Widget build(BuildContext context) {
    this.controller.setCurrentContext(context);
    return internalBuild(context);
  }

  Widget internalBuild(BuildContext context);
}