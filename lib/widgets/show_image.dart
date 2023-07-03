import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
    final String path;
  const ShowImage({required this.path,super.key});


  @override
  State<ShowImage> createState() => _ShowImageState();
  
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.path);
  }
}