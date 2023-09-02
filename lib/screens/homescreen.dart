import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seefood/constant.dart';
import 'package:seefood/models/foodmodel.dart';
import 'package:seefood/screens/shopview.dart';
import 'package:seefood/screens/widgets/cardfood.dart';
import 'package:seefood/screens/widgets/custombuttom.dart';

class homeview extends StatefulWidget {
  const homeview({super.key});

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  final List<modelfood> lisyfood = [
    modelfood(
        image: 'assets/images/salmon.png',
        name: 'Salamon Sushi ',
        price: '\$21.5'),
    modelfood(
        image: 'assets/images/tuna.png', name: 'tuna ', price: '\$19.5'),
    modelfood(
        image: 'assets/images/sushi (2).png', name: 'Fesh ', price: '\$25.5')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sea',
              style: TextStyle(
                  fontFamily: primaryfont, fontSize: 30, color: Colors.black),
            ),
            Text(
              'Food',
              style: TextStyle(
                  fontFamily: primaryfont, fontSize: 30, color: primarycolor),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>shopview()));
              },
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              )),
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics:const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primarycolor, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Get 32% Promo',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: primaryfont),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        custombuttom(
                          onTap: () {},
                          text: 'Redeem',
                          width: 170,
                          height: 70,
                        )
                      ],
                    ),
                    Spacer(),
                    const Image(
                        height: 125,
                        image: AssetImage('assets/images/sushi (1).png'))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: 'Search here....',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Food menu',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                  fontFamily: primaryfont),
            ),
            const SizedBox(
              height: 10,
            ), SizedBox(
              height: MediaQuery.of(context).size.height*0.33,
              child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: lisyfood.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => cardfood(
                            model: lisyfood[index],
                          )),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                    const  Image(
                          height: 70,
                          image: AssetImage('assets/images/sushi.png')),
                    const  SizedBox(
                        width: 30,
                      ),
                    const  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Salamon Sushi ', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontFamily: primaryfont),),
                    SizedBox(
                      height: 15,
                    ),
                    Text('\$12.5', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                    fontFamily: primaryfont),)
                        ],
                      ),
                    const  Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
