// ignore: file_names
import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goldshop/models/product.dart';
import 'package:goldshop/provider/category_provider.dart';
import 'package:goldshop/screens/AllProduct.dart';
import 'package:goldshop/screens/Cart.dart';
import 'package:goldshop/screens/ListProduct.dart';
import 'package:goldshop/widgets/CardProduct.dart';
import 'package:goldshop/widgets/Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  // ignore: non_constant_identifier_names
  final Stream<QuerySnapshot> Products =
      FirebaseFirestore.instance.collection('Products').snapshots();
  final Stream<QuerySnapshot> Categories =
      FirebaseFirestore.instance.collection('Categories').snapshots();

  // ignore: non_constant_identifier_names
  final List<String> _Carousel = [
    'assets/images/carosoue1.jpg',
    'assets/images/carosoue2.jpg',
    'assets/images/carosoue3.jpg',
    'assets/images/carosoue4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    List<Product> DataCategory = [];
  final provider = Provider.of<CategoryProvider>(context);
    provider.getNikeData();
    provider.getAdidasData();
    provider.getFilaData();
    provider.getVansData();
    provider.getConverseData();
    provider.getJumpmanData();
    DataCategory = 
      provider.getNikeDataList +
      provider.getAdidasDataList +
      provider.getFilaDataList +
      provider.getVansDataList +
      provider.getConverseDataList +
      provider.getJumpmanDataList;

    return Scaffold(
      key: _key,
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/Cart');
            },
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
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
            StreamBuilder<QuerySnapshot>(
                stream: Categories,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return cardCategory(
                            data['Image'], context, data['Name']);
                      }).toList(),
                    ),
                  );
                }),
            const SizedBox(
              height: 15,
            ),
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
                       Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => AllProduct(
                                snapshot: DataCategory,
                              ))));
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 247,
              child: StreamBuilder<QuerySnapshot>(
                  stream: Products,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 15),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return CardProduct(
                            name: '${data['Name']}',
                            image: '${data['Image']}',
                            price: '${data['Price']}',
                            description: '${data['Description']}',
                            brand: '${data['Brand']}',
                            state: '${data['State']}');
                      }).toList(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

Widget cardCategory(String img, BuildContext context, String brand) {
  List<Product> DataCategory = [];
  final provider = Provider.of<CategoryProvider>(context);
  if (brand == "Nike") {
    provider.getNikeData();
    DataCategory = provider.getNikeDataList;
  } else if (brand == "Adidas") {
    provider.getAdidasData();
    DataCategory = provider.getAdidasDataList;
  } else if (brand == "Fila") {
    provider.getFilaData();
    DataCategory = provider.getFilaDataList;
  } else if (brand == "Vans") {
    provider.getVansData();
    DataCategory = provider.getVansDataList;
  } else if (brand == "Converse") {
    provider.getConverseData();
    DataCategory = provider.getConverseDataList;
  } else {
    provider.getJumpmanData();
    DataCategory = provider.getJumpmanDataList;
  }
  // print(DataCategory[0].name);
  return GestureDetector(
    child: Container(
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
    ),
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => ListProduct(
                title: brand,
                snapshot: DataCategory,
              ))));
    },
  );
}
