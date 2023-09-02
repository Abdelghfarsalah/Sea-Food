import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seefood/cubits/cubit/detilsfood_cubit.dart';
import 'package:seefood/models/foodmodel.dart';
import 'package:seefood/screens/detils.dart';

import '../../constant.dart';

class cardfood extends StatelessWidget {
  const cardfood({
    super.key,
    required this.model,
  });
  final modelfood model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: (){
          BlocProvider.of<DetilsfoodCubit>(context).model=model;
          Navigator.push(context, MaterialPageRoute(builder:(context) {
            return detilsview();
          },));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Card(
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(height: 125, image: AssetImage(model.image)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    model.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: primaryfont),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(model.price),
                      const SizedBox(
                        width: 70,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const Text('4.8'),
                    ],
                  ),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
