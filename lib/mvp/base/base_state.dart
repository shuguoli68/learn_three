import 'package:flutter/material.dart';
import 'icontract.dart';

abstract class BaseState<T extends StatefulWidget, E extends IPresenter> extends State<T> {
  E mPresenter;
  @override
  void initState() {
    mPresenter = getPresenter();
    initViewState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildViews(context);
  }

  E getPresenter();
  void initViewState();
  Widget buildViews(BuildContext context);
}