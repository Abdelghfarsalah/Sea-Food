import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant.dart';

class custombuttom extends StatelessWidget {
  const custombuttom(
      {super.key,
      required this.onTap,
      required this.text,
      required this.height,
      required this.width});
  final void Function()? onTap;
  final String text;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(60)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  text,
                  style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey.withOpacity(0.9),
                      fontFamily: primaryfont),
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(FontAwesomeIcons.arrowRight,color: Colors.white,),
                )
              ],
            )));
  }
}
