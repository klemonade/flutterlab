import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArguments;

          return MaterialPageRoute(builder: (context) {
            return PassArgumentsScreen(
                title: args.title, message: args.message);
          });
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Flutter Lab',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleText = Padding(
        padding: EdgeInsets.all(20), child: Text('Let\'s Find Gas Station!'));

    final mainImage = Image.asset(
      'images/gas_station.jpeg',
      fit: BoxFit.cover,
    );

    final imgWithPadding =
        Padding(padding: const EdgeInsets.only(bottom: 20), child: mainImage);

    final argButton = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, PassArgumentsScreen.routeName,
            arguments: ScreenArguments(
                'Second Page', 'This data has been sent from the first page.'));
      },
      child: const Text('Click to send data'),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: Center(
            child: Column(
          children: [titleText, imgWithPadding, argButton],
        )));
  }
}

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  const PassArgumentsScreen({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
