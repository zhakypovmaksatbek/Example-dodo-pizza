final class InputValidate {
  InputValidate._();
  static InputValidate instance = InputValidate._();
  final regexPassword = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])');
  final regexEmail = RegExp(r'^.+@.+\..+');
  // static final _phoneNumberRegex = RegExp(r'[0-9]');

  String? validateGeneral(String? value) {
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return "Con not empty";
    } else if (passNonNullValue.length < 4) {
      return "enter min character 4";
    }
    return null;
  }

  String? validateEmail(String? value) {
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return "Enter your email address";
    } else if (passNonNullValue.length < 4) {
      return "minimum 4 characters required";
    } else if (!regexEmail.hasMatch(passNonNullValue)) {
      return "Enter your correct email address";
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    final numberNonNull = value ?? '';

    if (numberNonNull.length < 19) {
      return "minimum 13 characters required";
    } else {
      return null;
    }
  }
}
