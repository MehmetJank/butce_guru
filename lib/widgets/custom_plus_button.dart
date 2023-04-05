import 'package:butce_guru/widgets/blur_effect_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomPlusButton extends StatelessWidget {
  const CustomPlusButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return CustomBlurEffect(
              child: AlertDialog(
                title: const Center(
                  child: Text('Add Transaction'),
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        GoRouter.of(context).go(
                          '/revenue/add/editID',
                        );
                      },
                      child: const Text('Revenue'),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        GoRouter.of(context).go(
                          '/expense/add/editID',
                        );
                      },
                      child: const Text('Expense'),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
