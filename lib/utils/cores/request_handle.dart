import 'package:dio/dio.dart';

String handleError(Object error) {
  var message;
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        message = "Request was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        message = "Connection timeout";
        break;
      case DioErrorType.DEFAULT:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        message = "Receive timeout in connection";
        break;
      case DioErrorType.RESPONSE:
        message = "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        message = "Receive timeout in send request";
        break;
    }
  } else {
    message = "Unknown Error";
  }
  return message;
}
