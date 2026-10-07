
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
    RegExp nameRegExp = RegExp(r"^[a-zA-Z0-9_\s]+$");
    if(val == null || val.trim().isEmpty ){
      return "this feild is required" ; 
    }else if (nameRegExp.hasMatch(val) == false){
      return "enter valid name ";
    }else {
      return null ;
    }
  }


 }