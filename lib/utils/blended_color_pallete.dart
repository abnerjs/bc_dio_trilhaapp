import 'package:flutter/material.dart';

List<Color> generateBrighterMonochromaticPalette(
    List<Color> colors, int numberOfShades) {
  List<Color> palette = [];

  for (int i = 0; i < numberOfShades; i++) {
    double t = i / (numberOfShades - 1);

    numberOfShades == 1 ? t = 0.5 : t = t;

    Color blendedColor = Color.lerp(colors[0], colors[1], t)!.withOpacity(0.4);

    palette.add(blendedColor);
  }

  return palette;
}
