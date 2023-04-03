import 'package:flutter/material.dart';

Container TransactionWidget(Map<String, dynamic> item) {
  return Container(
    margin: const EdgeInsets.fromLTRB(6, 1, 6, 1),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white24.withOpacity(0.4),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Center(
                child: Text(
                  item["title"][0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  item["date"].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          "${item["amount"]} ₺",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: item["type"] == "expenses"
                ? Colors.red.shade900
                : Colors.green.shade900,
            fontSize: 17,
          ),
        ),
      ],
    ),
  );
}
