import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seefood/cubits/cubit/detilsfood_cubit.dart';
import 'package:seefood/screens/detils.dart';
import 'package:seefood/screens/homescreen.dart';
import 'package:seefood/screens/splashview.dart';

void main() {
  runApp(const seafood());
}

class seafood extends StatelessWidget {
  const seafood({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>DetilsfoodCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(
          
          iconTheme:const IconThemeData(
            color: Colors.black
          )
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          'splash':(context) =>const splashView(),
          'home':(context) =>const homeview(),
          'detuls':(context)=>const detilsview(),
        },
        initialRoute: 'splash',
      ),
    );
  }
}
