import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor Monetário 💋',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 73, 240)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Página Inicial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double realValue = 0.0;
  double usdValue = 0.0;
  double eurValue = 0.0;

  void convertCurrency(double value, String currency) {
    setState(() {
      switch (currency) {
        case 'BRL':
          realValue = value;
          usdValue = value / 5.0;
          eurValue = value / 6.0;
          break;
        case 'USD':
          usdValue = value;
          realValue = value / 5.0;
          eurValue = value * 0.8;
          break;
        case 'EUR':
          eurValue = value;
          realValue = value * 6.0;
          usdValue = value * 1.25;
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor Monetário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor em Real (BRL)',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  convertCurrency(double.parse(value), 'BRL');
                }
              },
            ),
            SizedBox(height: 20.0),
            Text('Valor em Dólar (USD): $usdValue'),
            SizedBox(height: 10.0),
            Text('Valor em Euro (EUR): $eurValue'),
          ],
        ),
      ),
    );
  }
}
