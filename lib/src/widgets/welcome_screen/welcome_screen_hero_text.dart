import 'package:flutter/material.dart';

class WelcomeScreenHeroText extends StatelessWidget {
  const WelcomeScreenHeroText({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = (size.height * 0.03).clamp(16.0, 36.0);
    final bottomPadding = (size.height * 0.02).clamp(12.0, 24.0);
    final horizontalPadding = (size.width * 0.08).clamp(16.0, 36.0);
    final titleFontSize = (size.width * 0.09).clamp(24.0, 36.0);
    final subtitleFontSize = (size.width * 0.045).clamp(14.0, 20.0);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: topPadding,
            bottom: bottomPadding,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: Text(
            "TOKOTO",
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Welcome to ',
            style: TextStyle(
              fontSize: subtitleFontSize,
              color: const Color.fromARGB(120, 0, 0, 0),
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'TOKOTO ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(120, 0, 0, 0),
                ),
              ),
              TextSpan(
                text: 'lets shop',
                style: TextStyle(color: const Color.fromARGB(121, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
