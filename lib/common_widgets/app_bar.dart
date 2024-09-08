import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context, String title) {
  return AppBar(
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    title: Text(title),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
    ],
  );
}
