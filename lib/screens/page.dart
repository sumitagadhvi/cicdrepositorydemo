import 'package:customdialogue/reusable_widget/textfield_widget.dart';
import 'package:customdialogue/screens/list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageClass extends StatefulWidget {
  const PageClass({Key? key}) : super(key: key);

  @override
  _PageClassState createState() => _PageClassState();
}

class _PageClassState extends State<PageClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page'),
      ),
      body:Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child:
      ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context,index){
          return ExpansionTile(
              title: Text('Title'),
              children: [
                ListView.builder(
                  shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context,index){
                      return const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child:  Card(
                        elevation: 1,
                        child: ListTile(
                          title: Text('data'),
                          trailing: Icon(Icons.person),
                        ),
                      ),
                      );

                 }
                )
              ],
          );
      })
      ));
  }
}
