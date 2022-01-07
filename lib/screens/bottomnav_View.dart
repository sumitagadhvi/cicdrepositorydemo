
import 'package:customdialogue/reusable_widget/bottom_Navbar.dart';
import 'package:customdialogue/screens/home_page.dart';
import 'package:customdialogue/screens/list_page.dart';
import 'package:customdialogue/screens/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  _BottomNavBarViewState createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int index=0;
  final navigatorKeys=[
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  @override
  void initState() {
print('index=$index');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:Stack(
        children: [
            buildOffstageNavigator(0),
            buildOffstageNavigator(1),
            buildOffstageNavigator(2),
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: index,
          onTap: (newindex)=>setState(() {
            index=newindex;
            print('index=$index');
          }),
          items:const[
            // ignore_for_file: prefer_const_constructors
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.message),
              label: 'Message',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today),
              label: 'Calender',
            )
          ]
      ),);
  }
  Widget buildOffstageNavigator(int currentindex){
    Map routeBuilders=_routeBuilders(context, currentindex);
    return Offstage(
      offstage: index!=currentindex,
      child:Navigator(
        onGenerateRoute: (setting){
          return MaterialPageRoute(builder: (context)=>routeBuilders[setting.name](context));
        },
      )
    );
  }
  Map<String,WidgetBuilder>_routeBuilders(BuildContext context,int thisIndex){
    print('buildindex=$thisIndex');
    return{
      '/':(context){
        return [
          HomePage(),
          PageClass(),
          ListPageView(),
        ].elementAt(thisIndex);
      }
    };
  }

}
