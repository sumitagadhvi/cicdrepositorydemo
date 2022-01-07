import 'package:customdialogue/reusable_widget/bottom_Navbar.dart';
import 'package:customdialogue/reusable_widget/dialogue_widget.dart';
import 'package:customdialogue/reusable_widget/popup_menu.dart';
import 'package:customdialogue/reusable_widget/reusable_class.dart';
import 'package:customdialogue/reusable_widget/textfield_widget.dart';
import 'package:customdialogue/screens/list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  static _HomePageState? of(BuildContext context) => context.findAncestorStateOfType<_HomePageState>();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController=TextEditingController();
  bool isChanged=false;
  String text='';
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore_for_file: prefer_const_constructors
        title: Text('HomePage'),
        actions: [
          IconButton(onPressed: (){
            CustomDialogueWidget().showAlertDialogue(context);
          }, icon: Icon(Icons.menu,color: Colors.black,))
        ],
      ),
      body: Center(
        child: ButtonWidget(
          onpressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPageView()));
          },
          text: 'Submit', style: ElevatedButton.styleFrom(
        ),

        ),
        // child: Text(status==true?string:'',style: TextStyle(fontSize: 20,color: Colors.black),)
      ),
    );
  }
  showAlertDialogue(){
    return showDialog(context: context,
        builder: (BuildContext context)=>AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content:SizedBox(
              height: 200,
              width: 300,
              child:
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                        child: Text('Enter Text',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                      ),
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.close,color: Colors.black,))
                    ],
                  ),
                  const  SizedBox(
                    height:  20,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextField(
                      onChanged: (String value){
                        text=value;
                      },
                      controller: textEditingController,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black,
                      decoration:const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE0E0E0),
                        hintText: 'Enter text',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFFE0E0E0) )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFE0E0E0)
                          ),

                        ),
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child:
                      ButtonWidget(
                          text: 'Submit',
                          onpressed: (){
                            Navigator.pop(context);
                            setState(() {
                              isChanged=true;
                            });

                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ))),
                    ),
                ],
              ),)
        ));
  }
  refResh(){
    setState(() {
      string=controller.text;
      status=true;
    });
  }
}
