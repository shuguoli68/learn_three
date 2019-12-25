
import 'icontract.dart';

abstract class BasePresenter<T extends IView, M extends IModel> extends IPresenter {
  T mView;
  M mModel;
  BasePresenter(T view){
    mView = view;
    mModel = getM();
  }

  handleError(error, errorCallback callback) {
    Exception exception = error as Exception;
    //TODO 可以对报错结果进行一轮处理，例如进行Toast 提示或者其他操作
    callback(exception);
  }

  M getM();
}

typedef errorCallback = void Function(Exception error);

