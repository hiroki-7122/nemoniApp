import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NemoniApp extends StatelessWidget {
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
            middle: Text('nemoni 顧客管理'),
          ),
          child: new NemoniAppHome(),
     ),
     routes: <String, WidgetBuilder>{
        '/customer_list_page': (BuildContext context) => CustomerListPage(),
        '/home_pageB': (BuildContext context) => HomePageB(),
     });
  }
}

class NemoniAppHome extends StatefulWidget {
  static const routeName = '/';

  @override
  _NemoniAppHomeState createState() => _NemoniAppHomeState();
}

class _NemoniAppHomeState extends State<NemoniAppHome> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_3, size: 36.0),
            title: const Text(
              "顧客リスト",
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600)
                  ),
              ),
            // Icon(IconData(0xf394,fontFamily: CupertinoIcons.iconFont,fontPackage: CupertinoIcons.iconFontPackage,))
            // アイコン番号を直接書くこーゆーのもあるらしい
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.flag, size: 24.0),
            title: const Text(
              "アポ一覧",
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600)
                  ),
              ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.repeat, size: 24.0),
            title: const Text(
              "フォロー先一覧",
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600)
                  ),
              ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_path_ecg, size: 24.0),
            title: const Text(
              "レポート",
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600)
                  ),
              ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.slider_horizontal_3, size: 24.0),
            title: const Text(
              "メニュー",
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600)
                  ),
              ),
        ],
        activeColor: Colors.cyan,
        inactiveColor: Color.fromRGBO(0, 0, 0, 0.4),
      ),      
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
              return CupertinoPageScaffold(child: CustomerListPage());
                break;
              case 1:
                return CupertinoPageScaffold(child: HomePageB());
                break;
            }
            return null;
          },
        );
      },
    );
  }
}

class CustomerListPage extends StatefulWidget {
  static const routeName = '/customer_list_page';

  @override
  CustomerListPageState createState() => CustomerListPageState();
}

class CustomerListPageState extends State<CustomerListPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              padding: EdgeInsets.fromLTRB(30,10,30,10),
              borderRadius: BorderRadius.all(Radius.circular(2.5)),
              child: Text("サンプルボタン",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
              color: Colors.cyan,
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: Text("サンプルのダイアログ"),
                      content: Text("アクションを選択してください。"),
                      actions: [
                        CupertinoDialogAction(
                            child: Text('閉じる'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            }),
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () {
                            print('OK');
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        )
                      ],
                    ));
              },
            ),
        ]),
      )
    );
    }
}

class HomePageB extends StatefulWidget {
  static const routeName = '/home_pageB';
  @override
  HomePageBState createState() => HomePageBState();
}

class HomePageBState extends State<HomePageB> {
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              padding: EdgeInsets.fromLTRB(30,10,30,10),
              borderRadius: BorderRadius.all(Radius.circular(2.5)),
              child: Text("サンプルボタン",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
              color: Colors.redAccent,
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: Text("サンプルのダイアログ"),
                      content: Text("アクションを選択してください。"),
                      actions: [
                        CupertinoDialogAction(
                            child: Text('閉じる'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            }),
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () {
                            print('OK');
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        )
                      ],
                    ));
              },
            ),
        ]),
      )
    );
  }
}