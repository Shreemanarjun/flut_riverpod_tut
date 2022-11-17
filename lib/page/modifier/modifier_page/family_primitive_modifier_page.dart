import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;
  final String gender;
  final String imageUrl;
  User(this.name, this.age, this.imageUrl, this.gender);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.name == name &&
      other.age == age &&
      other.gender == gender &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      imageUrl.hashCode;
  }
}

final users = [
  User(
    'arjun',
    22,
    'https://randomuser.me/api/portraits/men/20.jpg',
    'male',
  ),
  User(
    'Priyaranajn',
    21,
    'https://randomuser.me/api/portraits/men/10.jpg',
    'male',
  ),
  User(
    'Lisa',
    80,
    'https://randomuser.me/api/portraits/women/9.jpg',
    'female',
  )
];

Future<User> fetchUser(String username) async {
  await Future.delayed(const Duration(seconds: 1));
  return users.where((user) => user.name == username).first;
}

final userProvider = FutureProvider.family<User, String>(
  (ref, username) => fetchUser(username),
);

class FamilyPrimitiveModifierPage extends StatefulWidget {
  const FamilyPrimitiveModifierPage({Key? key}) : super(key: key);

  @override
  State<FamilyPrimitiveModifierPage> createState() =>
      _FamilyPrimitiveModifierPageState();
}

class _FamilyPrimitiveModifierPageState
    extends State<FamilyPrimitiveModifierPage> {
  String username = users.first.name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Primitive'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Consumer(
              builder: (context, ref, child) {
                final future = ref.watch(userProvider(username));
                return future.when(
                    data: (user) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(user.imageUrl),
                            radius: 80,
                            backgroundColor: Colors.black12,
                          ),
                          Text(user.name),
                          Text(user.age.toString()),
                          Text(user.gender),
                        ],
                      );
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()));
              },
            ),
          ),
          const Text('Search'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('User Name'),
              DropdownButton<String>(
                  value: username,
                  items: users
                      .map((e) => DropdownMenuItem(
                            value: e.name,
                            child: Text(e.name),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      username = value!;
                    });
                  }),
            ],
          )
        ],
      ),
    );
  }
}
