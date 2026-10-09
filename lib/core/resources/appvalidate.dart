
 class Appvalidate {

  static String? validateEmail(String? val){
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(val == null || val.trim().isEmpty ){
      return "this feild is required" ; 
    }else if (emailRegExp.hasMatch(val) == false){
      return "enter valid email";
    }else {
      return null ;
    }
  }

    static String? validatePassword(String? val){
    RegExp passwordRegExp = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
    if(val == null || val.trim().isEmpty ){
      return "this feild is required" ; 
    }else if (passwordRegExp.hasMatch(val) == false){
      return "The password must be at least eight characters long and contain both uppercase and lowercase letters. ";
    }else {
      return null ;
    }
  }

  static String? validateName(String? val){
    RegExp nameRegExp = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]+$");
    if(val == null || val.trim().isEmpty ){
      return "this feild is required" ; 
    }else if (nameRegExp.hasMatch(val) == false){
      return "enter valid name ";
    }else {
      return null ;
    }
  }

  static String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'this feild is required';
  }

  RegExp phoneRegex = RegExp(r'^01[0125][0-9]{8}$');

  if (!phoneRegex.hasMatch(value)) {
    return 'رقم الهاتف غير صحيح، يجب أن يبدأ بـ 010, 011, 012, 015 ويتكون من 11 رقم';
  }

  return null; 
}

 }