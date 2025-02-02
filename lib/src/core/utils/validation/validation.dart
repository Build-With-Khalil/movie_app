class AppValidators {
  static emptyFieldValidate(String textVal) {
    if (textVal == "") {
      return "Field is required";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required! Please enter your email address.';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  /// Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required! Please enter your password.';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    // final passwordRegex = RegExp(
    //     r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    // if (!passwordRegex.hasMatch(value)) {
    //   return "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character (e.g., @, #, %, &, *).";
    // }

    return null;
  }
}
