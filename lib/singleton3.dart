class Singleton3 {
  static Singleton3? _instance; // instance of this class

  //privatized constructor
  Singleton3._internal() {
    print("Private Constructor");
  }

  factory Singleton3() {
    _instance ??= Singleton3._internal();
    return _instance!;
  }
}
