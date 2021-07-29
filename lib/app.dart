import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LimoniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPageScaffold(
          navigationBar: new CupertinoNavigationBar(
            middle: Text('Limoni 顧客管理'),
          ),
          child: new LimoniAppHome(),
     ));
  }
}

class LimoniAppHome extends StatefulWidget {
  @override
  _LimoniAppHomeState createState() => _LimoniAppHomeState();
}

class _LimoniAppHomeState extends State<LimoniAppHome> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_3, color: Colors.cyan,),
            title: Text('顧客リスト'),
            // icon: Icon(IconData(
            //   0xf394,
            //   fontFamily: CupertinoIcons.iconFont,
            //   fontPackage: CupertinoIcons.iconFontPackage,
            // )),アイコン番号を直接書くこーゆーのもあるらしい
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.flag, size: 24.0, color: Colors.cyan,),
            title: Text('アポ一覧'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return CupertinoDialogTest();
                break;
              case 1:
                return CupertinoDialogTest();
                break;
            }
          },
        );
      },
    );
  }
}

class CupertinoDialogTest extends StatefulWidget {
  @override
  CupertinoDialogTestState createState() => CupertinoDialogTestState();
}

class CupertinoDialogTestState extends State<CupertinoDialogTest> {
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            color: Colors.cyan,
            borderRadius: new BorderRadius.circular(5.0),
            onPressed: () {
              showDialog(
                  builder: (context) => new CupertinoAlertDialog(
                    title: new Column(
                      children: <Widget>[
                        new Text("テストダイアログ"),
                      ],
                    ),
                    actions: <Widget>[new FlatButton(onPressed: () {  },
                    child: new Text("OK"))],
                  ), context: context);
            },
            child: Text('ダイアログを表示します'),
          ),
        ]);
  }
}