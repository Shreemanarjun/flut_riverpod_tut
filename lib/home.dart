import 'package:flut_riverpod_tut/page/provider/provider_home.dart';
import 'package:flut_riverpod_tut/widgets/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homestateProvider = StateProvider((ref) => 0);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build Home');
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: ProviderHome(),
      ),
    );
  }
}
