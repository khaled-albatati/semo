import 'package:get/get.dart';

// String pattternUsername = r'(^[a-zA-Z ]*$)';
validInput(String val, int min, int max, String type,) {
  if (type == "username") {
    if (val.length < min || val.length > max) {
     if (val.length < min) {
    return ('الحقل اقل من') + ("$min");
  }
  if (val.length > max) {
    return ("الحقل اكثر من") + ("$max");
  }
    } else {}
  
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "90".tr;
    }
  }

  if (type == "phone") {
    if (val.length < min || val.length > max) {
     if (val.length < min) {
    return ('الحقل اقل من') + ("$min ارقام");
  }
  if (val.length > max) {
    return ("الحقل اكثر من") + ("$max ارقام");
  }
    } else {}
  }

  if (type == "password") {
    if (val.length < 8 || val.length > 24) {
      if (val.length < 8) {
        return "91".tr;
      }
      if (val.length > 24) {
        return "92".tr;
      }
    } else {}
  }

  if (type == "OTP") {
    if (val.length < 6 || val.length > 6) {
      if (val.length < 6) {
        return "96".tr;
      }
      if (val.length > 6) {
        return "96".tr;
      }
    } else {}
  }

  if (val.isEmpty) {
    return ("95".tr);
  }
  if (val.length < min) {
    return ("100".tr) + ("$min");
  }
  if (val.length > max) {
    return ("101".tr) + ("$max");
  }

  if (type == "address") {
    if (!GetUtils.isUsername(val)) {
      if (val.isEmpty) {
    return ('الحقل فارغ');
  }
  if (val.length < min) {
    return ('الحقل اقل من') + ("$min");
  }
  if (val.length > max) {
    return ("الحقل اكثر من") + ("$max");
  }
    }
  }
}
