import 'dart:async';

mixin ValueTransformer {
  var transformValue = StreamTransformer<String, String>.fromHandlers(
      handleData: (status, sink) {
    if (status == 'true') {
      sink.add('false');
      print('sink tr false');
    }
    if (status == 'false') {
      sink.add('true');
      print('sink tr true');
    } else {
      print('Something went wrong with Sink data');
    }
  });
}
