import 'package:customdialogue/reusable_widget/dialogue_widget.dart';
import 'package:customdialogue/reusable_widget/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatefulWidget {
  PopupMenu({Key? key,}) : super(key: key);
  @override
  _PopupMenuState createState() => _PopupMenuState();
  static _PopupMenuState? of(BuildContext context) => context.findAncestorStateOfType<_PopupMenuState>();

}

class _PopupMenuState extends State<PopupMenu> {
  String dropDownValue='language';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: handleClick,
        itemBuilder:(BuildContext context){
          return {'Dialogue1','Dialogue2'}.map((String choice){
            return PopupMenuItem(
                value:  choice,
                child: Text(choice)
            );
          } ).toList();
        }
    );
  }

  void handleClick(String value){
    switch(value){
      case 'Dialogue1':
       CustomDialogueWidget().showAlertDialogue(context);
        break;
      case 'Dialogue2':

        break;
    }
  }

}
