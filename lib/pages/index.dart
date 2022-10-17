import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pizza_apps/pages/home_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexState();
}

class _IndexState extends State<IndexPage> {
  void _viewHome() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return const HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Full width button 1
            const Text(
              "Pizzeria",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 84,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 64,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                    ),
                    onPressed: () {
                      _viewHome();
                    },
                    child: const Text('Login'))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                    ),
                    onPressed: () {
                      _viewHome();
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ))),
          ],
        ),
      ),
    );
  }
}
