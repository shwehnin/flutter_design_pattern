class Singleton2 {
  static Singleton2? _instance; // instance of this class

  // privatized constructor
  Singleton2._internal() {
    print("Private constructor");
  }

  static get instance {
    _instance ??= Singleton2._internal();
    return _instance!;
  }
}
