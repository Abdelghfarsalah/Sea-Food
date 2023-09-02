import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:seefood/constant.dart';
import 'package:seefood/cubits/cubit/detilsfood_cubit.dart';
import 'package:seefood/models/foodmodel.dart';

class shopview extends StatelessWidget {
  const shopview({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DetilsfoodCubit>(context);
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primarycolor,
        centerTitle: true,
        title: const Text('My Cart'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<DetilsfoodCubit, DetilsfoodState>(
        builder: (context, state) {
          if (cubit.listfoodcart.isEmpty) {
            return  Center(child:Lottie.asset('assets/images/data.json'));
          } else {
            return ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.listfoodcart.length,
                itemBuilder: (context, index) => cart(index: index,
                      model: cubit.listfoodcart[index],
                    ));
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}

class cart extends StatelessWidget {
  const cart({super.key, required this.model,required this.index});
  final modelfood model;
final  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListTile(
            title: Text(
              model.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  model.price,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
              BlocProvider.of<DetilsfoodCubit>(context).removecard(index: index);
              },
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
