class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  /*
  * Correos validos
  *  [...]@[...].[...]
  * */
  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  /*
  * Contrasenas validas
  * Al menos 8 caracteres
  * Contiene al menos un dígito Contiene al menos un carácter alfa inferior y un carácter alfa superior
  * Contiene al menos un carácter dentro de un conjunto de caracteres especiales (@#%$^ etc.)
  * No contiene espacio, tabulador, etc.
  * */

  static bool isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
