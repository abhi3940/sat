import 'package:flutter/material.dart';
import 'package:sat/pallete.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String descriptionText;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.headerText,
      required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 35.0).copyWith(top: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15)
              .copyWith(left: 20, right: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  headerText,
                  style: const TextStyle(
                    fontFamily: 'Cera',
                    fontSize: 18,
                    color: Pallete.blackColor,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                descriptionText,
                style: const TextStyle(
                  fontFamily: 'Cera',
                  fontSize: 14,
                  color: Pallete.blackColor,
                ),
              ),
            ],
          ),
        ));
  }
}
