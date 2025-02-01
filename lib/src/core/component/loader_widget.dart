import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final double size;

  const LoaderWidget({
    super.key,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: Colors.teal,
            )
          : CupertinoActivityIndicator(
              color: Colors.teal,
            ),
    );
  }
}
