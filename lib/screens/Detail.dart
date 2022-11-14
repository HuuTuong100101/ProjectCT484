// ignore: file_names
import 'package:flutter/material.dart';
import 'package:goldshop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String brand;
  final String price;
  final String state;
  // ignore: use_key_in_widget_constructors
  const Detail({required this.image, required this.name, required this.price, required this.description, required this.brand, required this.state});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 350,
                  child: Card(
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.image),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${widget.name}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "\$${widget.price}",
                        style: const TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Wrap(
                          children: const <Widget>[
                            Text(
                              "Theo Cunningham, ý kiến wiki bắt nguồn từ một ngăn xếp ông tạo ra trong HyperCard vào cuối thập niên 1980. Vào khoảng mười năm sau, công nghệ wiki từ từ được công nhận là một cách đầy hứa hẹn để quản lý tri thức bí mật và công khai và khả năng này dẫn đến dự án bách khoa thư Nupedia, về sau trở thành Wikipedia. Vào đầu thập niên 2000, công nghệ wiki được nhận vào hãng trong vai phần mềm cộng tác. Nó thường được sử dụng để hỗ trợ giao thông trong dự án, xây dựng intranet, và viết tài liệu, mới đầu cho những người quen sử dụng máy tính. Vào tháng 12 năm 2002, Socialtext khởi đầu sản phẩm wiki nguồn mở thương mại. Phần mềm wiki nguồn mở có sẵn rộng rãi, được tải xuống và cài đặt nhiều vào những năm này.",
                              style: TextStyle(
                                  fontSize: 15, fontStyle: FontStyle.italic),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                         Navigator.pushNamed(context, '/Cart');
                          provider.addToCart(
                          name: widget.name,
                          price: widget.price,
                          brand: widget.brand,
                          image: widget.image);
                      },
                      child: const Text('Add to cart'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
