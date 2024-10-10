import 'package:flutter/material.dart';
import 'package:counter_app/adapter.dart';
import 'package:counter_app/platform_button.dart';
import 'package:counter_app/abstract_factory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostAPI postAPI = PostAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformButton(Theme.of(context).platform).build(
              () {
                print("Hey");
              },
              const Text("Click Me"),
            ),
            PlatformButton(TargetPlatform.iOS).build(
              () => print("Hello IOS Users"),
              const Text("Click IOS"),
            ),
            const SizedBox(
              height: 10,
            ),
            AbstractFactoryImpl.instance.buildButton(
              context,
              "Hello",
              () => print("Click Me"),
            ),
            const SizedBox(
              height: 10,
            ),
            AbstractFactoryImpl.instance.buildIndicator(context),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: postAPI.getPosts().length,
                itemBuilder: (context, index) {
                  final posts = postAPI.getPosts()[index];
                  return ListTile(
                    title: Text(posts.title),
                    subtitle: Text(posts.description),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
