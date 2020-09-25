
class BaseObserver<T> {
  Function _onSubscribe;
  Function _onSuccess;
  Function _onError;
  Function _onCompleted;

  void onSubscribe(Function event) {
    _onSubscribe = event;
  }

  void onSuccess(Function(T) event) {
    _onSuccess = event;
  }

  void onError(Function event) {
    _onError = event;
  }

  void onCompleted(Function event) {
    _onCompleted = event;
  }

  callSubscribe() => _onSubscribe?.call();

  callSuccess(T) => _onSuccess?.call(T);

  callError(Exception e) => _onError?.call(e);

  callCompleted() => _onCompleted?.call();
}
