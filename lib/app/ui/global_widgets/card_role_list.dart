import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sodimac/app/ui/theme/color.dart';

Widget CardRole(String title, String name, String jr, IconData iconState,
    Color colorState, String state) {
  return Card(
      child: Container(
    height: 100,
    padding: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  (const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: colorState, shape: BoxShape.circle),
                  child: Icon(
                    iconState,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(state,
                    style: (const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)))
              ],
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(name),
        const SizedBox(
          height: 5,
        ),
        Text(jr)
      ],
    ),
  ));
}
