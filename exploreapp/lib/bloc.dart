import 'package:rxdart/rxdart.dart';

import './value_transformer.dart';

class Bloc extends Object with ValueTransformer implements BaseBloc {
  var _radioController = BehaviorSubject<String>();
  var _themeController = BehaviorSubject<String>();

  Function(String) get feedStatus => _radioController.sink.add;
  Function(String) get sinkColorName => _themeController.sink.add;

  Stream<String> get recieveStatus =>
      _radioController.stream.transform(transformValue);
  Stream<String> get recieveColorName => _themeController.stream;

  @override
  dispose() {
    _radioController?.close();
    _themeController?.close();
  }
}

class BaseBloc {
  dispose() {}
}
