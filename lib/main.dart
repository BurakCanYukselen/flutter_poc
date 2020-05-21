import 'package:flutter_poc/app_index.dart';

void main() => runApp(FlutterPOC());

class FlutterPOC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter POC Project',
      home: Scaffold(
        body: ViewHelper.views[Views.mvc_stateful_bloc],
      ),
    );
  }
}
