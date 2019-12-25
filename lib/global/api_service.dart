
import 'dart:io';

import 'package:dio/dio.dart';

import 'api.dart';
import 'http_util.dart';

class ApiService{

  static Map<String, String> _headerMap;

  static Map<String, String> _getHeader() {
    if (null == _headerMap) {
      _headerMap = Map();
      _headerMap["Cookie"] = "";//MyConfig.cookie;
    }
    return _headerMap;
  }

  static Future<Map> base(String url, Map req,)async{
    var json = await HttpUtils.request(
        url,
        method: HttpUtils.GET,
        data: req,
        header: _headerMap,
    );
    return json;
  }

  static Future<Response> basePost(String url, {FormData req})async{
    var response;
    try {
      StringBuffer r = StringBuffer('{');
      for(int i = 0; i < req.fields.length; i++){
        r.write('"' + req.fields[i].key + '"');
        r.write(':"' + req.fields[i].value + '",');
      }
      r.write('}');
      print('post请求参数：' + r.toString());
      response = await Dio().post(Api.baseUrl + url, data: req, options: Options(headers: _getHeader()));
      print('post响应数据：' + response.toString());
    }on DioError catch (e) {
      /// 打印请求失败相关信息
      print('post请求出错：' + e.toString());
    }
    return response;
  }

  ///
  ///注册
  ///
  static Future<Response> register(String username, String password)async{
    FormData req = new FormData.fromMap({
      'username':username,
      'password':password,
      'repassword':password
    });
    return basePost(Api.register, req: req);
  }

  ///
  ///登录
  ///
  static Future<Response> login(String username, String password)async{
    FormData req = new FormData.fromMap({
      "username": "$username",
      "password": "$password",
    });
    return basePost(Api.login, req: req);
  }

  ///
  ///退出
  ///
  static Future<Map> logout()async{
    var req = {};
    return base(Api.logout, req);
  }

  ///
  ///首页banner
  ///
  static Future<Map> banner()async{
    var req = {
    };
    return base(Api.banner, req);
  }

  ///
  ///首页文章列表
  ///
  static Future<Map> homeArticle(int page)async{
    var req = {
    };
    return base(Api.article+'$page/json', req);
  }


}