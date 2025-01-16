import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? type;
  final bool? obscureText;
  final bool? required;

  late final String? _textInput = controller?.text;

  Future<bool> requiredValidator() async {
    if (_textInput == null || _textInput.isEmpty) {
      return true;
    }
    return false;
  }

  InputField(
      {super.key,
      this.controller,
      this.label,
      this.type,
      this.obscureText,
      this.required});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  Color _labelColor = const Color(0xFF58BDBD);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: 'Masukan ${widget.label}',
            labelStyle: const TextStyle(fontSize: 14),
            errorStyle: const TextStyle(color: Colors.red),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((state) {
              debugPrint('testing --- ${WidgetState.error}');
              if (state.contains(WidgetState.focused)) {
                return TextStyle(color: _labelColor);
              } else {
                return const TextStyle(color: Colors.black54);
              }
            }),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF58BDBD)),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8))),
        validator: (value) {
          if (widget.required!) {
            if (value == null || value.isEmpty) {
              setState(() {
                _labelColor = Colors.red;
              });
              return 'Please enter some text';
            }
            setState(() {
              _labelColor = const Color(0xFF58BDBD);
            });
            return null;
          }
          return null;
        },
      ),
    );
  }
}
