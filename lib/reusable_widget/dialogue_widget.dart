import 'package:customdialogue/reusable_widget/textfield_widget.dart';
import 'package:customdialogue/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
var string='';
bool status=false;
String text='';
TextEditingController controller=TextEditingController();
class CustomDialogueWidget  {

  showAlertDialogue(context){
    return showDialog(context: context,
        builder: (BuildContext context)=>AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content:StatefulBuilder( builder: (BuildContext context, StateSetter setState) {
            return
              Container(
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
                  controller: controller,
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
                        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                          setState((){
                          status=true;
                         string=controller.text;
                        });});
                          // status=true;
                          // string=controller.text;
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                ),
            ],
          ),);    },)
        ));
  }
}
