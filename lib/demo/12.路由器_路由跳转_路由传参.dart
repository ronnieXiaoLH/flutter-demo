import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const MyLogin(),
        ),
        GoRoute(
          path: '/catalog',
          builder: (context, state) => const MyCatalog(),
          routes: [
            GoRoute(
              path: 'cart',
              builder: (context, state) => const MyCart(msg: ''),
              // builder: (context, state) => const MyCart(),
            ),
          ],
        ),
      ],
    ));
  }
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // used by the OS task switcher
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyCatalog(),
                ),
              );
            },
            child: const Text('登录'),
          ),
        ),
      ),
    );
  }
}

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // used by the OS task switcher
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('列表页面'),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     // 直接传参
                  //     builder: (context) => const MyCart(msg: '鸡蛋'),
                  //     // 通过 RouteSettings 传参
                  //     // builder: (context) => const MyCart(),
                  //     // settings: const RouteSettings(arguments: '鸡蛋'),
                  //   ),
                  // );
                  pressHandler(context);
                },
                child: const Text('跳转到购物车页面'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pressHandler(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyCart(msg: '鸡蛋')),
    );

    print(result);
  }
}

class MyCart extends StatelessWidget {
  // 直接传参的方式，需要在这里接收参数
  const MyCart({super.key, required this.msg});
  final String msg;

  // RouteSettings 方式传参
  // const MyCart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final msg = ModalRoute.of(context)!.settings.arguments;

    return MaterialApp(
      // used by the OS task switcher
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('来自购物车列表页的数据：$msg'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Yep!');
                },
                child: const Text('返回'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
