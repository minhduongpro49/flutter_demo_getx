import 'package:get/get.dart';

class RxProcessState<T> {
  var rxStatus = Rx<ProcessStatus>();
  T data;
  String errorMessage;
  int nextPage = 1;

  RxProcessState({ProcessStatus status, this.data, this.errorMessage}) {
    rxStatus.value = status;
  }

  factory RxProcessState.init() {
    return RxProcessState()..setInitial();
  }

  void setSuccess(T data, {int nextPage}) {
    this.data = data;
    this.nextPage = nextPage;
    rxStatus.value = ProcessStatus.SUCCESS;
  }

  void setError(String message) {
    errorMessage = message;
    rxStatus.value = ProcessStatus.ERROR;
  }

  void setFirstLoading() {
    rxStatus.value = ProcessStatus.FIRST_LOAD;
  }

  void setLoadMore() {
    rxStatus.value = ProcessStatus.LOAD_MORE;
  }

  void setInitial() {
    data = null;
    nextPage = 1;
    errorMessage = null;
    rxStatus.value = ProcessStatus.INITIAL;
  }

  status() => rxStatus.value;

  isInitial() => status() == ProcessStatus.INITIAL;

  isFirstLoad() => status() == ProcessStatus.FIRST_LOAD;

  isLoadMore() => status() == ProcessStatus.LOAD_MORE;

  isSuccess() => status() == ProcessStatus.SUCCESS;

  isError() => status() == ProcessStatus.ERROR;

  isLoading() => isFirstLoad() || isLoadMore();

  hasReachEnd() => nextPage == null;

  void close() {
    rxStatus.close();
  }
}

enum ProcessStatus { INITIAL, FIRST_LOAD, LOAD_MORE, SUCCESS, ERROR }
