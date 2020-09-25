import 'dart:async';

import 'package:flutterdemogetx/domain/usecase/base/base_observer.dart';

import 'composite_subscription.dart';

abstract class UseCase<T, Params> {
  CompositeSubscription _disposables;

  UseCase() {
    _disposables = CompositeSubscription();
  }

  Future<Stream<T>> buildUseCaseStream(Params params);

  void execute(BaseObserver<T> observer, [Params params]) async {
    observer.callSubscribe();
    final StreamSubscription subscription = (await buildUseCaseStream(params))
        .listen((data) => observer.callSuccess(data),
            onDone: observer.callCompleted(),
            onError: (e) => observer.callError(e));
    _addSubscription(subscription);
  }

  void dispose() {
    if (!_disposables.isDisposed) {
      _disposables.dispose();
    }
  }

  void _addSubscription(StreamSubscription subscription) {
    if (_disposables.isDisposed) {
      _disposables = CompositeSubscription();
    }
    _disposables.add(subscription);
  }
}

abstract class CompletableUseCase<Params> extends UseCase<void, Params> {
  @override
  Future<Stream<void>> buildUseCaseStream(Params params);
}
