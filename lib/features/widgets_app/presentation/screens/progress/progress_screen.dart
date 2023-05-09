import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = "progress_screen";

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progress")),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 30),
            Text("Circular progress Indicator"),
            SizedBox(height: 10),
            CircularProgressIndicator(
                backgroundColor: Colors.black45, strokeWidth: 2),
            SizedBox(height: 30),
            Text("Circular y Linear controlados"),
            SizedBox(height: 10),
            _ControlledProgressIndicators(),
          ],
        ),
      ),
    );
  }
}

class _ControlledProgressIndicators extends StatelessWidget {
  const _ControlledProgressIndicators();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((element) => element < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;
          return TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            tween: Tween(begin: 0, end: progressValue),
            builder: (context, value, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(value: value, backgroundColor: Colors.black45, strokeWidth: 2),
                    const SizedBox(width: 20),
                    Expanded(child: LinearProgressIndicator(value: value)),
                  ],
                ),
              );
            },
          );
        });
  }
}
