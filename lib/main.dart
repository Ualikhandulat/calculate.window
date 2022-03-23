import 'package:calculate_window/configs/providers.dart';
import 'package:calculate_window/configs/routes.dart';
import 'package:calculate_window/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DBProvider.initDB();

  runApp(MultiProvider(
    providers: providers,
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
