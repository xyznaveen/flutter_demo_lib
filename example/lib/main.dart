import 'package:flutter/material.dart';
import 'package:flutter_demo_lib_naveen/flutter_demo_lib_naveen.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_demo_lib_naveen example',
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  static const _plugin = FlutterDemoLib();
  final _name = TextEditingController(text: 'Flutter');
  String _platform = 'Detecting...';
  String _greeting = '';

  @override
  void initState() {
    super.initState();
    _loadPlatform();
  }

  Future<void> _loadPlatform() async {
    final platform = await _plugin.getPlatformVersion();
    if (!mounted) return;
    setState(() => _platform = platform);
  }

  Future<void> _greet() async {
    final greeting = await _plugin.greet(_name.text);
    if (!mounted) return;
    setState(() => _greeting = greeting);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_demo_lib_naveen')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Platform: $_platform'),
            const SizedBox(height: 24),
            TextField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Your name'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _greet,
              child: const Text('Greet from native code'),
            ),
            const SizedBox(height: 24),
            Text(_greeting, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
