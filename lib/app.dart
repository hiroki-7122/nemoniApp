import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


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
          child: new NemoniAppHome(),
     ),
     routes: <String, WidgetBuilder>{
        '/customer_list_page': (BuildContext context) => CustomerListPage(),
        '/appoint_page': (BuildContext context) => AppointPage(),
        '/follow_page': (BuildContext context) => FollowPage(),
        '/report_page': (BuildContext context) => ReportPage(),
        '/menu_page': (BuildContext context) => MenuPage(),

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
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 8, 15, 8),
                  leading: Center(
                    widthFactor: 1,
                    child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "2 ",
                                      style: GoogleFonts.robotoCondensed(
                                      textStyle: Theme.of(context).textTheme.headline4,
                                      color: Color.fromRGBO(0, 0, 0, .7),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                  )),
                                  TextSpan(text: "USERS",style: GoogleFonts.robotoCondensed(
                                      textStyle: Theme.of(context).textTheme.headline4,
                                      color: Color.fromRGBO(0, 0, 0, .7),
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                  )),
                                ],
                              ),
                            )
                    ),
                  middle: Center(
                    child: 
                      CupertinoSearchTextField(
                        placeholder: "",
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        prefixInsets: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.headline4,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                  ),
                      )
                  ),
                  trailing: Center(
                    widthFactor: 1.3,
                    child:
                      CupertinoButton(
                        minSize: 22,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Icon(CupertinoIcons.plus, size: 20.0),
                        color: Colors.cyan,
                        onPressed: () {}
                      ),
                  ),
                  ),
                child: CustomerListPage());
                break;
              case 1:
                return CupertinoPageScaffold(child: AppointPage());
                break;
              case 2:
                return CupertinoPageScaffold(child: FollowPage());
                break;
              case 3:
                return CupertinoPageScaffold(child: ReportPage());
                break;
              case 4:
              return CupertinoPageScaffold(child: MenuPage());
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
      floatingActionButton: CupertinoSearchTextField(
      onChanged: (String value) {
        print('The text has changed to:');
      },
      onSubmitted: (String value) {
        print('Submitted text:');
      },
    ),
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'ホーム',
            ),
          ),
        ],
      )
    );
    }
}

class AppointPage extends StatefulWidget {
  static const routeName = '/Appoint_page';
  @override
  AppointPageState createState() => AppointPageState();
}

class AppointPageState extends State<AppointPage> {
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





class FollowPage extends StatefulWidget {
  static const routeName = '/follow_page';
  @override
  FollowPageState createState() => FollowPageState();
}

class FollowPageState extends State<FollowPage> {
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Default'),
          ]
        ),
      );
    }
}

class ReportPage extends StatefulWidget {
  static const routeName = '/report_page';
  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
    Widget build(BuildContext context) {
      return Text("AAA");
    }
}

class MenuPage extends StatefulWidget {
  static const routeName = '/menu_page';
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
    Widget build(BuildContext context) {
      return Text("AAA");
    }
}