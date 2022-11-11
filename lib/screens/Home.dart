// ignore: file_names

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:goldshop/widgets/CardProduct.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  // ignore: non_constant_identifier_names
  final List<String> _Carousel = [
    'assets/images/carosoue1.jpg',
    'assets/images/carosoue2.jpg',
    'assets/images/carosoue3.jpg',
    'assets/images/carosoue4.jpg',
  ];
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Gold Shop'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
      ),
        body: SizedBox(
          // height: double.infinity,
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Swiper(
                  itemBuilder: (BuildContext context, int i) {
                    return Image.asset(
                      _Carousel[i],
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: _Carousel.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                child: Row(
                  children: const <Widget>[
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    cardCategory('assets/images/adidas_n.jpg'),
                    cardCategory('assets/images/Nike_2.jpg'),
                    cardCategory('assets/images/converse_n.jpg'),
                    cardCategory('assets/images/fila_n.jpg'),
                    cardCategory('assets/images/Jordan_n.jpg'),
                    cardCategory('assets/images/vans_a.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 20,
                child: Row(
                  children: <Widget>[
                    const Text(
                      "Products",
                      // ignore: unnecessary_const
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const Text(
                        "See more",
                        // ignore: unnecessary_const
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/allproduct');
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardProduct(),
                    CardProduct()
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}

Widget cardCategory(String img) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: CircleAvatar(
      radius: 30,
      backgroundColor: Colors.red,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(img),
      ),
    ),
  );
}