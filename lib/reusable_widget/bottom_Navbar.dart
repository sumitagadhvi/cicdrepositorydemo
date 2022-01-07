import 'package:customdialogue/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
  static _BottomNavbarState? of(BuildContext context) => context.findAncestorStateOfType<_BottomNavbarState>();

}

class _BottomNavbarState extends State<BottomNavbar> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }


}