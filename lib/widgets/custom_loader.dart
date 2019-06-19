import 'package:flutter/cupertino.dart';
import 'package:pokemon/utils/constants.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 100.0, child: Image.asset(ImageConstants.loader));
  }
}
