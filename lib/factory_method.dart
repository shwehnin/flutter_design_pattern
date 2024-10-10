enum EmpType { programmer, hr, boss }

abstract class Employee {
  void work();
  factory Employee(EmpType type) {
    switch (type) {
      case EmpType.programmer:
        return Programmar();
      case EmpType.hr:
        return HRManager();
      case EmpType.boss:
        return Boss();
      default:
        return Programmar();
    }
  }
}

class Programmar implements Employee {
  @override
  void work() {
    print("Coding an app");
  }
}

class HRManager implements Employee {
  @override
  void work() {
    print("Recruiting people");
  }
}

class Boss implements Employee {
  @override
  void work() {
    print("Leading people");
  }
}

class FactoryMethod {
  static Employee getEmployee(String type) {
    switch (type) {
      case "programmer":
        return Programmar();
      case "hr":
        return HRManager();
      case "boss":
        return Boss();
      default:
        return Programmar();
    }
  }
}
