import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../functions/check_connection.dart';

class BalanceCard extends StatefulWidget {
  final String balance;
  final String income;
  final String expense;
  final bool amountLoading;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.expense,
    required this.income,
    required this.amountLoading,
  });

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  late String? _status;
  late Icon? _icon;

  @override
  void initState() {
    super.initState();
    _icon = const Icon(Icons.device_unknown);
    getConnectionInfo().then((status) {
      setState(() {
        _icon = status.icon;
        _status = status.status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24.withOpacity(0.4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: IconButton(
                        onPressed: () {
                          getConnectionInfo().then((status) {
                            setState(() {
                              _icon = status.icon;
                              _status = status.status;
                            });
                          });

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              _status!,
                              style: const TextStyle(color: Colors.black87),
                            ),
                            duration: const Duration(seconds: 2),
                            backgroundColor: AppColors.primaryColor,
                          ));
                        },
                        icon: Icon(
                          _icon!.icon,
                          color: AppColors.primaryColor,
                        )),
                  ),
                  const Text(
                    'V A R L I K L A R',
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              widget.amountLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Text(
                      '₺${widget.balance}',
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 50),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Gelir',
                              style: TextStyle(color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            widget.amountLoading
                                ? const Center(
                                    child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator()))
                                : Text(
                                    '₺${widget.income}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Gider',
                              style: TextStyle(color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            widget.amountLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  )
                                : Text(
                                    '₺${widget.expense}',
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
