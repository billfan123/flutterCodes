import 'package:flutter/material.dart';

// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TextA extends StatefulWidget {
  TextA({Key key}) : super(key: key);

  @override
  _TextAState createState() => new _TextAState();
}

const textStyle = const TextStyle(
  fontFamily: 'Raleway',
);

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = DefaultTextStyle.of(context).style;
    return new Scaffold(
        appBar: new AppBar(),
        body: new DefaultTextStyle(
            style: new TextStyle(
                inherit: true,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
                color: Colors.blue),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Text("hello"),
                ],
              ),
            )));
  }
}

class _TextAState extends State<TextA> {
  bool _active = false;

  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        child: new Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Hello world",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                      height: 1.2,
                      fontFamily: "Courier",
                      background: new Paint()..color = Colors.yellow,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
                Text(
                  "Hello world! I'm Jack. " * 4,
                  maxLines: 1,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: "Home: "),
                  TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue),
//                          recognizer: _tapRecognizer
                  ),
                ]))
              ]),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
