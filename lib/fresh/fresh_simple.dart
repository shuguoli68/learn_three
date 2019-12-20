import 'package:flutter/material.dart';
import 'package:zeking_refresh/zeking_refresh.dart';

class FreshSimple extends StatefulWidget {
  @override
  State<FreshSimple> createState() => _FreshSimpleState();
}

class _FreshSimpleState extends State<FreshSimple> {
  List<String> datas = List();
  ZekingRefreshController _refreshController;
  int page = 0;
  static const int count = 5;//一页可能最多可见10个item

  @override
  void initState() {
    super.initState();
    _refreshController = ZekingRefreshController();
    _refreshController.refreshingWithLoadingView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('刷新加载'),
      ),
      body: ZekingRefresh(
        controller: _refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: ListView.builder(
          cacheExtent: 30.0,
          padding: EdgeInsets.all(2),
          itemBuilder: (BuildContext context, int index) {
            return _itemWidget(index);
          },
          itemCount: datas.length,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  onRefresh() {
    page=0;
    datas.clear();
    _reqData(true);
  }

  onLoading() {
    _reqData(false);
  }

  _reqData(bool isRefresh) async {
    Future.delayed(const Duration(milliseconds: 200,), (){
      List<String> mData = List();
      for(int i=0;i<count;++i){
        mData.add('$page $i value $page $i');
      }
      setState(() {
        datas.addAll(mData);
      });
      if(page%2 == 0){//成功
        if(isRefresh){
          if(mData.isNotEmpty) {
            _refreshController.refreshSuccess();
            //一页可能最多可见10个item
            if (mData.length < count) _refreshController.loadMoreNoMore();
          } else {
            _refreshController.refreshEmpty();
          }
        }else{
          if(mData.isNotEmpty)
            _refreshController.loadMoreSuccess();
          else
            _refreshController.loadMoreNoMore();
        }
        ++page;
      }else{//失败
        print('fail');
        if(isRefresh){
          _refreshController.refreshFaild();
        }else{
          _refreshController.loadMoreFailed();
        }
      }
    });
  }

  Widget _itemWidget(int index) {
    String item = datas[index];
    return GestureDetector(
      onTap: (){
        print('position:$index , $item');
      },
      child: Padding(padding: EdgeInsets.all(5.0),child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
//          border: Border.all(color: Colors.black12, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          children: <Widget>[
            Flex(direction: Axis.horizontal,children: <Widget>[
              Expanded(flex:1, child: Padding(padding: EdgeInsets.only(left: 5),child: Text(item, style: TextStyle(fontSize: 16),maxLines: 3,),),),
              IconButton(icon: Icon(Icons.delete,color: Colors.red,), onPressed: (){
                setState(() {
                  datas.remove(item);
                });
              })
            ],),
            Padding(padding: EdgeInsets.all(3)),
            Flex(direction: Axis.horizontal,children: <Widget>[
              Expanded(flex:1, child: Text(item,style: TextStyle(color: Colors.black54),)),
              Expanded(flex:1, child: Text(item,style: TextStyle(color: Colors.black54),)),
            ],)
          ],
        ),
      ),),
    );
  }
}