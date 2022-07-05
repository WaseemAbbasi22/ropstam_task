extension extString on String {

  bool get isValidUserName{
    // String pattern = r'^[a-zA-Z]+(\s[a-zA-Z]+)?$';
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.]+\.[a-zA-Z]+";
    final nameRegExp = RegExp(pattern);
    return nameRegExp.hasMatch(this);
  }
  bool get isValidTitle{
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.]+\.[a-zA-Z]+";
    final nameRegExp = RegExp(pattern);
    return nameRegExp.hasMatch(this);
  }



  bool get isValidIncome{
    String pattern = r'^[1-9]+[0-9]*$';

    final nameRegExp =  RegExp(pattern);
    return nameRegExp.hasMatch(this);
  }
  bool get isValidPassword{
    String pattern = r'^[1-9]+[0-9]*$';

    final passwordRegExp =  RegExp(pattern);
    return passwordRegExp.hasMatch(this);
  }
  // bool get isValidPicture{
  //   final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
  //   return phoneRegExp.hasMatch(this);
  // }

}