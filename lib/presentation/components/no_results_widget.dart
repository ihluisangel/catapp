import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: 200,
            child: Column(
              children: [
                Lottie.asset(
                  'assets/lottie/no_found.json',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("No result found")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
