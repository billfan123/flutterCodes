import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = DefaultTextStyle.of(context).style;
    return new Scaffold(
        appBar: new AppBar(),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Text("hello"),
              RaisedButton(
                child: Text("normal"),
                onPressed: () {
                  print("RaisedButton");
                },
              ),
              FlatButton(
                child: Text("normal"),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text("normal"),
                onPressed: () {
                  print("OutlineButton");
                },
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  print("OutlineButton");
                },
              ),
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: _onPressed,
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: _onPressed,
              ),
              FlatButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: _onPressed,
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }

  void _onPressed() {

  }
}