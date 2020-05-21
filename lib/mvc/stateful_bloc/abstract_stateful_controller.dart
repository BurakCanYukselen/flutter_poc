import 'package:flutter_poc/app_index.dart';

abstract class AbstractStatefulController<
    ViewModel extends AbstractStatefulViewModel,
    Event extends AbstractBlocEvent> {
  ViewModel viewModel;

  AbstractStatefulController(this.viewModel) {
    this._eventController.stream.listen(this._eventStreamCallBack);
  }

  final StreamController<ViewModel> _stateController = StreamController<ViewModel>();
  StreamSink<ViewModel> get _stateInput => this._stateController.sink;
  Stream<ViewModel> get _stateOutput => this._stateController.stream;

  final StreamController<Event> _eventController = StreamController<Event>();
  Sink<Event> get _eventInput => this._eventController.sink;

  void callEvent(Event event) => this._eventInput.add(event);

  void _eventStreamCallBack(Event event) {
    this.viewModel = event.handle(this.viewModel);
    this._stateInput.add(this.viewModel);
  }

  Widget stremReader(Widget Function(ViewModel) child) {
    return StreamBuilder<ViewModel>(
      stream: this._stateOutput,
      initialData: this.viewModel,
      builder: (BuildContext context, AsyncSnapshot<ViewModel> snapshot) {
        return Container(
          child: child(snapshot.data),
        );
      },
    );
  }

  void disposeStreamController() {
    this._stateController.close();
    this._eventController.close();
  }

  void setCurrentContext(BuildContext context) {
    this.viewModel.context = context;
  }
}
