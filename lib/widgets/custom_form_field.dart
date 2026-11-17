import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final bool isPassword;
  final TextEditingController Controller;
  final String? Function(String?) Validator;
  CustomFormField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    required this.Validator,
    required this.Controller,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: widget.Controller, validator: widget.Validator,obscureText: widget.isPassword,
    decoration: InputDecoration(prefixIcon: Icon(widget.icon),hintText: widget.hint,border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
