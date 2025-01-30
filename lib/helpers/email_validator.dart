class EmailValidator {
  dynamic value;

  EmailValidator({this.value});

  bool isValid() {
    return !RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$',
    ).hasMatch(value ?? '');
  }
}
