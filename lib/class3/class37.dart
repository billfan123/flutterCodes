import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/class3/utils/SwitchAndCheckBoxTestRoute.dart';

class class37 extends State<SwitchAndCheckBoxTestRoute> {
  //定义一个controller
  TextEditingController _unameController = TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                )));
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Test"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: _formKey, //设置globalKey，用于后面获取FormState
                autovalidate: true, //开启自动校验
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "电子邮件地址",
                              prefixIcon: Icon(Icons.email),
                              border: InputBorder.none //隐藏下划线
                              ),
                          // 校验用户名
                          validator: (v) {
                            return v.trim().length > 0 ? null : "用户名不能为空";
                          }),
                      decoration: BoxDecoration(
                          // 下滑线浅灰色，宽度1像素
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey[200], width: 1.0))),
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: "密码",
                            hintText: "您的登录密码",
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        //校验密码
                        validator: (v) {
                          return v.trim().length > 5 ? null : "密码不能少于6位";
                        }),
                    // 登录按钮
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              //在这里不能通过此方式获取FormState，context不对
                              //print(Form.of(context));

                              // 通过_formKey.currentState 获取FormState后，
                              // 调用validate()方法校验用户名密码是否合法，校验
                              // 通过后再提交数据。
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                //验证通过提交数据
                              }
                            },
                          ),
                        ),
                      ]),
                    ),
                    Builder(
                      builder: (ctx) {
                        return Column(
                          children: <Widget>[
                            RaisedButton(
                              child: Text("移动焦点"),
                              onPressed: () {
                                //将焦点从第一个TextField移到第二个TextField
                                // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                                // 这是第二种写法
                                if (null == focusScopeNode) {
                                  focusScopeNode = FocusScope.of(context);
                                }
                                focusScopeNode.requestFocus(focusNode2);
                              },
                            ),
                            RaisedButton(
                              child: Text("隐藏键盘"),
                              onPressed: () {
                                // 当所有编辑框都失去焦点时键盘就会收起
                                focusNode1.unfocus();
                                focusNode2.unfocus();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                )
            )
        )
    );
  }

  void _onPressed() {
    print(_unameController.text);
  }
}
