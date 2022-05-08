enum themesAll { dark, light, deffault}
class Settings{
  themesAll? _character = themesAll.deffault;
  //
  getCharacter() => _character;
  setCharacter(themesAll? value) => _character = value;
}