import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final bool? isEmail;
  final bool? obscureText;
  final bool? required;
  final double? width;
  final bool? errorValidation;
  final String? errorValidationText;
  final TextInputType? keyboardType;
  final int? minLines;

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
      this.isEmail,
      this.obscureText,
      this.required,
      this.width,
      this.errorValidation,
      this.errorValidationText,
      this.keyboardType,
      this.minLines});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  Color _labelColor = const Color(0xFF58BDBD);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.only(bottom: 17),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        minLines: widget.minLines,
        maxLines: widget.obscureText != true && widget.minLines != null
            ? widget.minLines
            : 1,
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: 'Masukan ${widget.label}',
            labelStyle: const TextStyle(fontSize: 14),
            errorStyle: const TextStyle(color: Colors.red),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((state) {
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
              return '${widget.label} harus diisi!';
            } else if (widget.isEmail ?? false) {
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                setState(() {
                  _labelColor = Colors.red;
                });

                return 'Email tidak valid!';
              }
            }
          } else if (widget.errorValidation!) {
            setState(() {
              _labelColor = Colors.red;
            });
            return '${widget.errorValidationText}';
          } else if (widget.isEmail!) {
            if (!RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$',
            ).hasMatch(value ?? '')) {
              setState(() {
                _labelColor = Colors.red;
              });

              return 'Email tidak valid!';
            }
          }
          setState(() {
            _labelColor = const Color(0xFF58BDBD);
          });
          return null;
        },
      ),
    );
  }
}
