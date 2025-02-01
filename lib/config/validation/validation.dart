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
      return '';
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

    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character (e.g., @, #, %, &, *).";
    }

    return null;
  }

  static String? validateConfirmPassword(String? password, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password.';
    }

    if (password != value) {
      return 'Passwords do not match. Please re-enter.';
    }

    return null;
  }
}
