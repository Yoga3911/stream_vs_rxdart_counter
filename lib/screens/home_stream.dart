import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int val = 0;
  late StreamController<int> controller;
  late Stream<int> stream;
  late StreamSink sink;

  @override
  void initState() {
    controller = StreamController();
    stream = controller.stream;
    sink = controller.sink;
    sink.add(val);
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                sink.add(val--);
              },
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(width: 10),
            StreamBuilder<int>(
              stream: stream,
              builder: (_, snapshot) {
                return Text(
                  snapshot.data.toString(),
                );
              },
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                sink.add(val++);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
