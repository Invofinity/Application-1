import 'package:News_App/constants.dart';
import 'package:News_App/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  TextEditingController _emailController;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: _emailController,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
