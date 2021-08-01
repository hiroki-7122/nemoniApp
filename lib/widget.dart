import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app.dart';

Widget BottomTabMenu() {
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
                navigationBar: navCustomerListPage(),
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

CupertinoNavigationBar navCustomerListPage() {
return CupertinoNavigationBar(
  padding: EdgeInsetsDirectional.fromSTEB(15, 8, 15, 8),
  leading: Center(
    widthFactor: 1,
    child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "2 ",
                      style: googleFontRobotCondensed(24.0, FontWeight.w600, .7)),
                  TextSpan(text: "USERS",
                      style: googleFontRobotCondensed(10.0, FontWeight.w600, .7)),
                ],
              ),
            ),
    ),
  middle: Center(
    child: 
      CupertinoSearchTextField(
        placeholder: "",
        borderRadius: BorderRadius.all(Radius.circular(8)),
        prefixInsets: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
        style: googleFontRobot(12.0, FontWeight.w600, 1.0),
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
  );
}

CupertinoAlertDialog alertDialog(context) {
  return CupertinoAlertDialog(
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
  );
}

TextStyle googleFontRobot(fontSize, weight, opacity) {
  return GoogleFonts.roboto(
      color: Color.fromRGBO(0, 0, 0, opacity),
      fontSize: fontSize,
      fontWeight: weight,
    );
}

TextStyle googleFontRobotCondensed(fontSize, weight, opacity) {
  return GoogleFonts.robotoCondensed(
      color: Color.fromRGBO(0, 0, 0, opacity),
      fontSize: fontSize,
      fontWeight: weight,
    );
}