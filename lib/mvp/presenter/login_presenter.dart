
import 'package:dio/dio.dart';
import 'package:learn_three/global/api_service.dart';
import 'package:learn_three/mvp/base/base_present.dart';
import 'package:learn_three/mvp/base/icontract.dart';
import 'package:learn_three/mvp/contract/login_contract.dart';
import 'package:learn_three/mvp/model/login_model.dart';

class LoginPresenter extends BasePresenter<ILoginView, ILoginModel> implements ILoginPresenter{

  LoginPresenter(ILoginView view) : super(view);

  @override
  ILoginModel getM() {
    return new LoginModel();
  }

  @override
  login(String name, String pwd) {
//    mModel.login(name, pwd);
    ApiService.login(name, pwd).then<Response>((response){
      mView.updateView(response.data.toString());
      return;
    });
  }



}