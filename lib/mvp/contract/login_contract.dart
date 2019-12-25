
import 'package:learn_three/mvp/base/icontract.dart';

abstract class ILoginView extends IView{
  updateView(String data);
}

abstract class ILoginPresenter extends IPresenter{
  login(String name , String pwd);
}

abstract class ILoginModel extends IModel{
  login(String name , String pwd);
}