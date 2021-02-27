enum Gender { male, female, other }

abstract class People {
  String _name;
  Gender _gender;
  int _age;

  String get name => _name;
  Gender get gender => _gender;
  int get age => _age;

  void setInfo(String name, int age, Gender gender) {
    _name = name;
    _gender = gender;
    _age = age;
  }
}

class User extends People {
  static final User _instance = User._internal();

  User._internal() {
    setInfo('PNST', 30, Gender.male);
  }

  factory User() => _instance;

  @override
  String toString() {
    return '''
      Name: $name
      Gender: $gender
      Age: $age
    ''';
  }
}
