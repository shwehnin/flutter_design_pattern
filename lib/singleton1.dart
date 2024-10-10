class Singleton1 {
  static Singleton1? _instance; // instance of this class

  //privatized constructor
  Singleton1._internal() {
    print("Private Constructor");
  }

  static Singleton1 getInstance() {
    _instance ??= Singleton1._internal();
    return _instance!;
  }
}

Singleton1 singleton1 = Singleton1.getInstance();
