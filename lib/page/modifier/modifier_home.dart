import 'package:flut_riverpod_tut/page/modifier/modifier_page/auto_dispose_modifier_page.dart';
import 'package:flut_riverpod_tut/page/modifier/modifier_page/family_object_modifier_page.dart';
import 'package:flut_riverpod_tut/page/modifier/modifier_page/family_primitive_modifier_page.dart';
import 'package:flutter/material.dart';

class ModifierHome extends StatelessWidget {
  const ModifierHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const FamilyPrimitiveModifierPage(),
                      ),
                    );
                  },
                  child: const Text('Family Primitive'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FamilyObjectModifierPage(),
                      ),
                    );
                  },
                  child: const Text('Family Object'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AutoDisposeModifierPage(),
                      ),
                    );
                  },
                  child: const Text('Auto Dispose'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
