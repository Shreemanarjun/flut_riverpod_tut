import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Car {
  final int speed;
  final int doors;

  const Car({this.speed = 120, this.doors = 4});

  Car copyWith({
    int? speed,
    int? doors,
  }) {
    return Car(
      speed: speed ?? this.speed,
      doors: doors ?? this.doors,
    );
  }

  @override
  String toString() => 'Car(speed: $speed, doors: $doors)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car && other.speed == speed && other.doors == doors;
  }

  @override
  int get hashCode => speed.hashCode ^ doors.hashCode;
}

class CarNotifier extends StateNotifier<Car> {
  CarNotifier() : super(const Car());

  void setDoors(int doors) async {
    state = state.copyWith(doors: doors);
  }

  void increaseSpeed() {
    state = state.copyWith(speed: state.speed + 5);
  }

  void hitBreak() {
    if (state.speed != 0) {
      state = state.copyWith(speed: max(0, state.speed - 30));
    }
  }
}

final stateNotifierProvider =
    StateNotifierProvider<CarNotifier, Car>((ref) => CarNotifier());

class StateNotifierView extends StatelessWidget {
  const StateNotifierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('State Notifier Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      print('speed car built');
                      final carspeed = ref.watch(
                          stateNotifierProvider.select((value) => value.speed));
                      return Text('Speed:$carspeed',
                          style: const TextStyle(fontSize: 30));
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      print('doors car built');
                      final cardoors = ref.watch(
                          stateNotifierProvider.select((value) => value.doors));
                      return Text('Doors:$cardoors',
                          style: const TextStyle(fontSize: 30));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () {
                          ref
                              .read(stateNotifierProvider.notifier)
                              .increaseSpeed();
                        },
                        child: const Text('Increase Speed +5'),
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        onPressed: () {
                          ref.read(stateNotifierProvider.notifier).hitBreak();
                        },
                        child: const Text('Hit Break -30'),
                      );
                    },
                  ),
                ],
              ),
              Consumer(builder: (context, ref, child) {
                final car = ref.watch(stateNotifierProvider);
                return Slider(
                  value: car.doors.toDouble(),
                  onChanged: (v) {
                    ref
                        .read(stateNotifierProvider.notifier)
                        .setDoors(v.toInt());
                  },
                  max: 100,
                );
              }),
            ],
          ),
        ));
  }
}
