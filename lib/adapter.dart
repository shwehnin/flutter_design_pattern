import 'dart:convert';

class PostAPI1 {
  String getYoutubePosts() {
    return '''
  [
    {
      "title": "Automatic Code Generation with Flutter",
      "description": "Generate Automatically"
    },
    {
      "title": "Twitter Clone with Flutter", 
      "description": "Clones"
    }
  ]
''';
  }
}

class PostAPI2 {
  String getMediumPosts() {
    return '''
  [
    {
      "header": "Kotlin MultiPlatform",
      "bio": "Compose library"
    },
    {
      "header": "Whatsapp Clone with Flutter", 
      "bio": "Clones"
    }
  ]
''';
  }
}

abstract class IPostAPI {
  List<Post> getPosts();
}

class Post {
  final String title;
  final String description;

  Post({
    required this.title,
    required this.description,
  });
}

// ADAPTER
class PostAPI1Adapter implements IPostAPI {
  final api = PostAPI1();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getYoutubePosts()) as List;
    return data
        .map(
          (post) => Post(
            title: post['title'],
            description: post['description'],
          ),
        )
        .toList();
  }
}

class PostAPI2Adapter implements IPostAPI {
  final api = PostAPI2();

  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getMediumPosts()) as List;
    return data
        .map((post) => Post(
              title: post['header'],
              description: post['bio'],
            ))
        .toList();
  }
}

class PostAPI implements IPostAPI {
  final api1 = PostAPI1Adapter();
  final api2 = PostAPI2Adapter();
  @override
  List<Post> getPosts() {
    return api1.getPosts() + api2.getPosts();
  }
}
