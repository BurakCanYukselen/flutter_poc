import 'package:flutter_poc/app_index.dart';

enum Views{
  mvc_stateless,
  mvc_stateful_bloc
}

class ViewHelper{
  static final Map<Views, Widget> views = {
    Views.mvc_stateless: POCStatelessView(),
    Views.mvc_stateful_bloc: POCStatefulView(),
  };
}