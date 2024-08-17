class InputValidator {
  //
  static String noEmptyFiled = 'this filed can not be empty';
  //
  static String? nameValidator(String? text) {
    //
    if (text == null) return noEmptyFiled;
    if (text.isEmpty) return noEmptyFiled;
    text.trim();
    //
    return null;
  }

  static String? emailValidator(String? text) {
    //
    if (text == null) return noEmptyFiled;
    if (text.isEmpty) return noEmptyFiled;
    text.trim();
    //
    final validCharacters = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!validCharacters.hasMatch(text)) {
      return 'use a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? text) {
    //
    if (text == null) return noEmptyFiled;
    if (text.isEmpty) return noEmptyFiled;
    text.trim();
    //
    if (text.length < 8) {
      return "use 8 letters at least";
    }

    return null;
  }

  static String? phoneValidator(String? text) {
    //
    if (text == null) return noEmptyFiled;
    if (text.isEmpty) return noEmptyFiled;
    text.trim();
    //
    final validCharacters = RegExp(r'^[0-9]+$');

    if (text.length != 10 || !validCharacters.hasMatch(text)) {
      return 'use a valid number';
    }
    return null;
  }
}
