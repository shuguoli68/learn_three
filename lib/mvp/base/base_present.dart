
import 'icontract.dart';

abstract class BasePresenter<T extends IView> extends IPresenter {
  T view;
  BasePresenter(IView v):view = v;

  handleError(error, errorCallback callback) {
    Exception exception = error as Exception;
    //TODO 可以对报错结果进行一轮处理，例如进行Toast 提示或者其他操作
    callback(exception);
  }
}

typedef errorCallback = void Function(Exception error);