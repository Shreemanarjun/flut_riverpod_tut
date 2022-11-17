import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flut_riverpod_tut/page/modifier/modifier_page/family_primitive_modifier_page.dart';

class UserRequest {
  final bool isFemale;
  final int minAge;
  UserRequest({
    required this.isFemale,
    required this.minAge,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRequest &&
        other.isFemale == isFemale &&
        other.minAge == minAge;
  }

  @override
  int get hashCode => isFemale.hashCode ^ minAge.hashCode;
}

Future<User> fetchUser(UserRequest request) async {
  await Future.delayed(const Duration(seconds: 1));
  final gender = request.isFemale ? 'female' : 'male';
  return users.firstWhere(
    (user) => user.gender == gender && user.age >= request.minAge,
    orElse: () => users.first,
  );
}

final userProvider = FutureProvider.family<User, UserRequest>(
    (ref, userrequest) async => fetchUser(userrequest));

class FamilyObjectModifierPage extends StatefulWidget {
  const FamilyObjectModifierPage({Key? key}) : super(key: key);

  @override
  State<FamilyObjectModifierPage> createState() =>
      _FamilyObjectModifierPageState();
}

class _FamilyObjectModifierPageState extends State<FamilyObjectModifierPage> {
  static final ages = [18, 25, 30, 40];
  bool isFemale = true;
  int minAge = ages.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Object Modifier'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Consumer(
              builder: (context, ref, child) {
                final future = ref.watch(userProvider(UserRequest(
                  isFemale: isFemale,
                  minAge: minAge,
                )));
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
              const Text('Female'),
              Switch(
                  value: isFemale,
                  onChanged: (value) {
                    setState(() {
                      isFemale = value;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Minimum Age'),
              DropdownButton<String>(
                  value: minAge.toString(),
                  items: ages
                      .map((e) => DropdownMenuItem(
                            value: e.toString(),
                            child: Text('$e years old'),
                          ))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      minAge = int.parse(v!);
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
