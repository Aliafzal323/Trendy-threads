class Validation {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailValid = RegExp(
      r'^[a-zA-Z0-9.\+\-]+@[a-zA-Z0-9.\+\-]+\.[a-zA-Z]+$',
    );

    if (!emailValid.hasMatch(value)) {
      return 'Invalid Email Address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one Upper Character";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number ";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }

    final phoneNoValid =
        RegExp(r'^(\+){0,1}([0-9]){0,5}(?:[0-9]\x20?){6,9}[0-9]$');

    if (!phoneNoValid.hasMatch(value)) {
      return 'Invalid Phone Number Format';
    }

    return null;
  }
}
