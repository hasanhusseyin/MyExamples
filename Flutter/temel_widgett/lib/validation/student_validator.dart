class StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null) {
      return "İsim boş olamaz!";
    }
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır&#39";
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null) {
      return "İsim boş olamaz!";
    }
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır&#39";
    }
    return null;
  }

  String? validateGrade(String? value) {
    var grade = int.parse(value!);
    if(grade<0 || grade >100){
      return "Geçersiz Not ";
    }
    return null;
  }
}
