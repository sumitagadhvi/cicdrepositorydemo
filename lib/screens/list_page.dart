import 'package:customdialogue/reusable_widget/textfield_widget.dart';
import 'package:customdialogue/screens/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPageView extends StatefulWidget {
  const ListPageView({Key? key}) : super(key: key);

  @override
  _ListPageViewState createState() => _ListPageViewState();
}

class _ListPageViewState extends State<ListPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Listpage'),
      ),
      body: Center(
        child:ButtonWidget(
          onpressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PageClass()));
          },
          text: 'Submit', style: ElevatedButton.styleFrom(
        ),

        ),
      ),
    );
  }
}
