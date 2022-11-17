import 'package:flut_riverpod_tut/home.dart';
import 'package:flut_riverpod_tut/observer.dart';
import 'package:flut_riverpod_tut/page/modifier/modifier_home.dart';
import 'package:flut_riverpod_tut/page/notifier/notifier_home.dart';
import 'package:flut_riverpod_tut/page/provider/provider_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:statsfl/statsfl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ProviderScope(
    observers: [
      Logger(),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const Home(),
        routes: <GoRoute>[
          GoRoute(
            path: 'provider',
            builder: (BuildContext context, GoRouterState state) =>
                const ProviderHome(),
          ),
          GoRoute(
            path: 'notifier',
            builder: (BuildContext context, GoRouterState state) =>
                const NotifierHome(),
          ),
          GoRoute(
            path: 'modifier',
            builder: (BuildContext context, GoRouterState state) =>
                const ModifierHome(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StatsFl(
      isEnabled: false, //Toggle on/off
      width: 600, //Set size
      height: 80, //
      maxFps: 90, // Support custom FPS target (default is 60)
      showText: true, // Hide text label
      sampleTime: .5, //Interval between fps calculations, in seconds.
      totalTime: 15, //Total length of timeline, in seconds.
      align: Alignment.topLeft, //
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
