import 'package:flutter/material.dart';

class WidgetTestScreen extends StatefulWidget {
  const WidgetTestScreen({super.key});

  @override
  State<WidgetTestScreen> createState() => _WidgetTestScreenState();
}

class _WidgetTestScreenState extends State<WidgetTestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Screen Test Screen'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/expense/add');
                      },
                      child: const Text('Test Expense Add'),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/revenue/add');
                      },
                      child: const Text('Test Income Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homeScreen');
                  },
                  child: const Text('Test Home Screen'),
                ),
                // const SizedBox(height: 8.0),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/screenTest');
                //   },
                //   child: const Text('Test Combined Data'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
