class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static final RegExp _passwordRegExp = RegExp( // con problemas
    /*
    * Mínimo 1 letra mayúscula.
    * Mínimo 1 letra minúscula.
    * Mínimo 1 carácter especial.
    * Número mínimo 1.
    * Mínimo 8 caracteres.
    * 30 caracteres como máximo.
    * */
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$',
  );

  /*
  * Mínimo ocho caracteres, al menos una letra y un número
  * "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
  * Mínimo ocho caracteres, al menos una letra, un número y un carácter especial:
  * "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
  * Mínimo ocho caracteres, al menos una letra mayúscula, una letra minúscula y un número:
  * "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
  * */
  /*
  * Correos validos
  *  [...]@[...].[...]
  * */
  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) { //no funciona
    return _passwordRegExp.hasMatch(password);
  }

  static ispasswordValidator(String password){
    if(password.isEmpty){
      return 'Contraseña no valida';
    }else if(password.length < 8){
      return 'Contraseña no valida';
    }
    return null;
  }
  static isNameValidator(String name){
    if(name.isEmpty){
      return 'Nombre invalido';
    }else if(name.length < 3){
      return 'Nombre invalido';
    }
    return null;
  }
}
