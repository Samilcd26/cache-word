import 'dart:async';

class MyStream<T> {
  final StreamController<T> _controller = StreamController<T>.broadcast();
  Stream<T> get getResponse => _controller.stream;

  // Stream kapatma
  void close() => _controller.close();

  add(T streamObjet) => _controller.add(streamObjet);
}
