import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World!'),
              SizedBox(height: 8),
              Text('Dwight Steven F. Fietas'),
              Text('INF242MWA'),
              Text('Lab Activity 0A: Flutter Installation and Project Setup'),
            ],
          ),
        ),
      ),
    );
  }
}