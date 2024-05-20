import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Widget verticalSpacing(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpacing(double width) {
  return SizedBox(
    width: width,
  );
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

ThemeData getTheme(BuildContext context) {
  return Theme.of(context);
}

showSnackbar(BuildContext context, String msg) {
  SnackBar snackbar = SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

Future<double> fetchImageAspectRatio(String imageUrl) async {
  final size = await getImageSize(imageUrl);

  double aspectRatio = size.width / size.height;
  return aspectRatio;
}

Future<Size> getImageSize(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    final bytes = response.bodyBytes;
    final image = await decodeImageFromList(bytes);
    return Size(image.width.toDouble(), image.height.toDouble());
  } else {
    throw Exception('Failed to load image');
  }
}
