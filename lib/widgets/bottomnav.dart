import 'package:flut_riverpod_tut/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Consumer(
          builder: (context, ref, child) {
            return Wrap(alignment: WrapAlignment.spaceAround, children: [
              BottomNavButtons(
                title: 'Riverpod',
                subtitle: 'Providers',
                isClicked: 0 == ref.watch(homestateProvider),
                onPressed: () {
                  ref.read(homestateProvider.notifier).state = 0;
                  context.go('/provider');
                },
              ),
              BottomNavButtons(
                title: 'Riverpod',
                subtitle: 'Notifiers',
                isClicked: 1 == ref.watch(homestateProvider),
                onPressed: () {
                  ref.read(homestateProvider.notifier).state = 1;
                  context.go('/notifier');
                },
              ),
              BottomNavButtons(
                title: 'Riverpod',
                subtitle: 'Modifiers',
                isClicked: 2 == ref.watch(homestateProvider),
                onPressed: () {
                  ref.read(homestateProvider.notifier).state = 2;
                  context.go('/modifier');
                },
              ),
            ]);
          },
        ));
  }
}

class BottomNavButtons extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isClicked;
  final void Function() onPressed;
  const BottomNavButtons({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isClicked = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Text(title),
          Text(
            subtitle,
            style: TextStyle(
              color: isClicked ? Colors.amber : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
