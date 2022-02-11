import 'package:flutter/material.dart';
import 'package:provider_test/theme.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/models/menu.dart';
import 'package:provider_test/models/cart.dart';
import 'package:provider_test/pages/menu.dart';
import 'package:provider_test/pages/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => MenuModel()),
        ChangeNotifierProxyProvider<MenuModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, menu, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.menu = menu;
              return cart;
            }),
      ],
      child: MaterialApp(
          title: 'Provider Demo',
          theme: appTheme,
          initialRoute: '/menu',
          routes: {
            '/menu': (context) => const MyMenu(),
            '/cart': (context) => const MyCart(),
          }),
    );
  }
}
