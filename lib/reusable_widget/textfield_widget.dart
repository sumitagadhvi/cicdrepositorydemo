

import 'package:flutter/material.dart';
class TextFormFieldWidget extends StatefulWidget {
  TextInputType textInputType;
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final Function functionValidate;
  final String parametersValidate;
  final TextInputAction actionKeyboard;
  final Function onSubmitField;
  // final Function onFieldTap;

  TextFormFieldWidget(
      {required this.hintText,
        required this.textInputType,
        this.obscureText = false,
        required this.controller,
        required this.functionValidate,
        required this.parametersValidate,
        this.actionKeyboard = TextInputAction.next,
        required this.onSubmitField,
        // required  this.onFieldTap,
        required this.prefixIcon});

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  double bottomPaddingToError = 12;

  @override
  Widget build(BuildContext context) {
    // ignore_for_file: prefer_const_constructors

    return Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color(0xFFFB8C00),
        ),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child:

          TextFormField(
            cursorColor: Color(0xFFFB8C00),
            obscureText: widget.obscureText,
            keyboardType: widget.textInputType,
            // textInputAction: widget.actionKeyboard,
            // focusNode: widget.focusNode,
            style: TextStyle(
              color:Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2,
            ),
            // initialValue: widget.defaultText,
            decoration: InputDecoration(
              fillColor: Colors.grey,
              filled: true,
              suffixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFB8C00)),
              ),
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 1.2,
              ),
              contentPadding: EdgeInsets.only(
                  top: 12, bottom: bottomPaddingToError, left: 8.0, right: 8.0),
              isDense: true,
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 1.2,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFB8C00)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFB8C00)),
              ),
            ),
            controller: widget.controller,
            validator: (value) {
              if (widget.functionValidate != null) {
                String resultValidate =
                widget.functionValidate(value, widget.parametersValidate);
                if (resultValidate != null) {
                  return resultValidate;
                }
              }
              return null;
            },
            onFieldSubmitted: (value) {
              if (widget.onSubmitField != null) widget.onSubmitField();
            },
            // onTap: () {
            //   if (widget.onFieldTap != null) widget.onFieldTap();
            // },
          ),)
    );
  }
}

commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return '';
}

String requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return '';
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

// button widget
class ButtonWidget extends StatefulWidget {
  String text;
  VoidCallback onpressed;
  late ButtonStyle style;
  ButtonWidget({required this.text,required this.onpressed,required this.style});
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}
class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(data:Theme.of(context).copyWith(
      primaryColor: Color(0xFFFB8C00),
    ) ,
        child: ElevatedButton(
            onPressed:(){
              widget.onpressed();
            },
            child: Text(widget.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
            style:widget.style));
  }
}