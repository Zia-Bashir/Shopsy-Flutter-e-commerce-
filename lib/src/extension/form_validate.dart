isValidEmail(value) {
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegExp.hasMatch(value);
}

isValidName(value) {
  final nameRegExp =
      RegExp(r"^(?=.{3,20}$)(?![_.-])(?!.*[_.-]{2})[a-zA-Z0-9_-]+([^._-])$");
  return nameRegExp.hasMatch(value);
}

isValidPassword(value) {
  final passwordRegExp = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  return passwordRegExp.hasMatch(value);
}

// bool get isNotNull {
//   return this != null;
// }

isValidPhone(value) {
  final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
  return phoneRegExp.hasMatch(value);
}
