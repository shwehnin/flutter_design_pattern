import 'package:flutter/material.dart';
import 'package:counter_app/prototype1.dart';
import 'package:counter_app/singleton3.dart';
import 'package:counter_app/singleton2.dart';
import 'package:counter_app/singleton1.dart';
import 'package:counter_app/home_screen.dart';
import 'package:counter_app/factory_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  Employee employee = FactoryMethod.getEmployee('boss');
  employee = Programmar();
  employee.work();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Singleton2 singleton2 = Singleton2.instance;
    Singleton1 singleton1 = Singleton1.getInstance();
    Singleton1 singleton3 = Singleton1.getInstance();
    Singleton1 singleton4 = Singleton1.getInstance();
    Singleton3 singleton5 = Singleton3();
    Singleton3 singleton6 = Singleton3();
    Singleton3 singleton7 = Singleton3();

    Person person = const Person(
      name: 'Hnin Hnin',
      lastName: 'Wai',
      age: 30,
      nation: 'MY',
      email: 'hnin@gmail.com',
    );
    Person person1 = person.clone();
    print(person1.name);
    print(person.name);
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: const Text("Go to Home"),
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, widget) {
              String str = ref.read(provider);
              return Text(str);
            })
          ],
        ),
      ),
    );
  }
}

final Provider<String> provider = Provider((ref) {
  return "Hello";
});
