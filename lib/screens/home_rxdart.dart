import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HomeRxDartPage extends StatefulWidget {
  const HomeRxDartPage({super.key});

  @override
  State<HomeRxDartPage> createState() => _HomeRxDartPageState();
}

class _HomeRxDartPageState extends State<HomeRxDartPage> {
  late BehaviorSubject<int> stream = BehaviorSubject.seeded(0);

  @override
  void dispose() {
    stream.close();
    super.dispose();
  }

  void _increment() => stream.add(stream.value + 1);

  void _decrement() => stream.add(stream.value - 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => _decrement(),
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(width: 10),
            StreamBuilder<int>(
              stream: stream,
              builder: (_, snapshot) => Text(
                snapshot.data.toString(),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => _increment(),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
