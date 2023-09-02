import 'package:flutter/material.dart';
import 'package:seefood/constant.dart';
import 'package:seefood/screens/homescreen.dart';
import 'package:lottie/lottie.dart';
class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  void initState() {
    super.initState();
    gotohome();
  }

  void dispose() {
    super.dispose();
  }

  Future<void> gotohome() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homeview()), (route) => false);
    });
  }

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: primarycolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Sea Food',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: primaryfont),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: Lottie.asset('assets/images/data.json'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'THE TASTE OF JAPANESE FOOD ',
                style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                    fontFamily: primaryfont),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
