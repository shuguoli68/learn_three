import 'package:flutter/material.dart';
import 'package:learn_three/mvp/base/base_state.dart';
import 'package:learn_three/mvp/contract/login_contract.dart';
import 'package:learn_three/mvp/presenter/login_presenter.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends BaseState<LoginPage, ILoginPresenter> implements ILoginView{

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();

  @override
  Widget buildViews(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,//输入框抵住键盘
      body: Center(
          child: SingleChildScrollView(
            child: Container(
//            color: Colors.white,
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Column(
                children: <Widget>[

                  Text('登录到`玩Android`',style: TextStyle(fontSize: 24),),

                  Padding(padding: EdgeInsets.only(top: 30)),

                  TextFormField(
                      controller: controller1,
                      decoration: InputDecoration(
                        labelText: '账号：',
//                      helperText: '账号长度至少3位！',
                        hintText: '请输入账号',
                        prefixIcon: Icon(Icons.account_box),
                      ),
                      validator: (v) {
                        return v.trim().length >= 3 ? null : "账号长度至少3位！";
                      }
                  ),

                  TextFormField(
                      controller: controller2,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: '密码：',
//                      helperText: '密码长度至少6位！',
                        hintText: '请输入密码',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: (v) {
                        return v.trim().length >= 6 ? null : "密码长度至少6位！";
                      }
                  ),

                  Padding(padding: EdgeInsets.only(top: 30)),

                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.green,
                    child: Text('登录'),
                    onPressed: (){
                      mPresenter.login(controller1.text, controller2.text);
                    },
                  ),

                  Padding(padding: EdgeInsets.only(top: 20)),

                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.green,
                    child: Text('游客进入'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }

  @override
  getPresenter() {
    return new LoginPresenter(this);
  }

  @override
  void initViewState() {
    // TODO: implement initViewState
  }

  @override
  updateView(String data) {

  }
}