import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seefood/cubits/cubit/detilsfood_cubit.dart';
import 'package:seefood/screens/shopview.dart';
import 'package:seefood/screens/widgets/custombuttom.dart';

import '../constant.dart';

class detilsview extends StatefulWidget {
  const detilsview({super.key});

  @override
  State<detilsview> createState() => _detilsviewState();
}

class _detilsviewState extends State<detilsview> {
  int numderofchoose = 0;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DetilsfoodCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<DetilsfoodCubit, DetilsfoodState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child:
                      Image(height: 200, image: AssetImage(cubit.model.image))),
              const SizedBox(
                height: 50,
              ),
            const  Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child:  Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('4.8')
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  cubit.model.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: primaryfont),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Pacific salmon undergo significant transformations when returning to freshwater from the ocean: Some species go from silver to a deep maroon; others turn a deep black. Male sockeye salmon develop humps on their backs. The seven species of Pacific salmon typically range in length from a foot and a half to two and a half feet.',
                  style: TextStyle(height: 2, color: Colors.grey[600]),
                ),
              ),
              const Spacer(),
              Container(
                height: 180,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: primarycolor),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Row(
                        children: [
                          Text(
                            cubit.model.price,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (numderofchoose > 0) {
                                    numderofchoose--;
                                  }
                                });
                              },
                              icon: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '$numderofchoose',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                    numderofchoose++;
                                  
                                });
                              },
                              icon: const Icon(
                                FontAwesomeIcons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ,custombuttom(onTap: (){
                    BlocProvider.of<DetilsfoodCubit>(context).addcard(model: cubit.model, numder: numderofchoose);
                    if (numderofchoose!=0)
                    {
                      showDialog(context: context, builder:(context)=> AlertDialog(
                      backgroundColor:primarycolor ,
                      title: const Text('Successful added to card '),
                      titleTextStyle:const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                      content: const Text('Go to shop '),
                      contentTextStyle:const TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),
                      actions: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const shopview()));
                        }, icon:const Icon(Icons.done_all,color: Colors.white,))
                      ],
                    ));
                    
                    }
                    else{
                      showDialog(context: context, builder:(context)=> AlertDialog(
                      backgroundColor:primarycolor ,
                      title: const Text('Sorry , there is an error '),
                      titleTextStyle:const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                      content: const Text('Please add some food'),
                      contentTextStyle:const TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),
                      actions: [
                        
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child:const Text('Ok',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),))
                        ],
                    ));
                    
                    }
                    
                    }, 
                  text: 'Add to card', height: 60, width: MediaQuery.of(context).size.width*0.9)
                  ],
                ),
              )
            ],
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
