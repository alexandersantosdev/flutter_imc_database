import 'package:flutter/material.dart';

getMenuButton(String title, IconData icon, Function fn) => TextButton(
      onPressed: () => fn(),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );

getTextField(String hintText, IconData prefixIcon,
        TextEditingController controller) =>
    Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(
                prefixIcon,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );

getButton(String text, Function fn) => ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(double.infinity, 60),
        ),
        textStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 20,
        )),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () => fn(),
      child: Text(text),
    );
