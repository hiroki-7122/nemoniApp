import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget.dart';


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
    return BottomTabMenu();
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
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Padding(
        padding: EdgeInsets.only(left: 10, top: 88,right: 10,bottom: 0),
        child: CustomScrollView(
          slivers: <Widget>[
            // CupertinoSliverNavigationBar(
            //   largeTitle: Text(
            //     'ホーム',
            //   ),
            // ),
            SliverFixedExtentList(
                itemExtent: 75.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset("images/NRI_icon.jpeg"),
                            margin: EdgeInsets.all(8),
                          ),
                          Text('宇都宮 海斗', style: googleFontRobot(14.0, FontWeight.w600, 1.0)),
                        ]
                      ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset("images/NTTDATA_icon.png"),
                              margin: EdgeInsets.all(8),
                            ),
                            Text('榎田 皓太', style: googleFontRobot(14.0, FontWeight.w600, 1.0)),
                          ]
                        ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset("images/NTTDATA_icon.png"),
                                margin: EdgeInsets.all(8),
                              ),
                              Text('甲斐 壮', style: googleFontRobot(14.0, FontWeight.w600, 1.0)),
                            ]
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset("images/Yahoo_icon.jpeg"),
                                margin: EdgeInsets.all(8),
                              ),
                              Text('矢野 大輝', style: googleFontRobot(14.0, FontWeight.w600, 1.0)),
                            ]
                          ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                    builder: (_) => alertDialog(context),
                );
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