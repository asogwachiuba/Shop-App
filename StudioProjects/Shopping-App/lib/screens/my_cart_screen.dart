import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/app_theme.dart';
import 'AppData.dart';


class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  bool _onTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        IconButton(
        icon: const Icon(Icons.check),
        color: _onTapped ? Colors.black : Colors.white,
        onPressed: () {
          if(!_onTapped) {}
          else {}
          setState(() {
            _onTapped = !_onTapped;
          });
        },)
        ],
        title: Text(
          'MY CART',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
    ),
      body: Container(
        color: Colors.black,
        child: Column(
              children: [
        Consumer<ItemsOnSale>(
              builder: (context, lists, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MyCartListTile(item: lists.my_cart_list[index]);
                    },
                    itemCount: lists.my_cart_list.length,
                    scrollDirection: Axis.vertical,);}),
              ],
            )
      ),
    );
  }
}

class MyCartListTile extends StatelessWidget {
  Items? item;
   MyCartListTile({
    required this.item,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        right: 8.0,
        bottom: 8.0,),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        height: 80,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              width: 5.0,
            ),
            SizedBox(width: 5.0,),
            Container(
              child: Image.asset('assets/${item!.image}'),
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item!.name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                ),
                Text('Category : ${item!.category.toString()}'),
                const SizedBox(height: 10,),
                Text('Price : ${item!.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            Spacer(flex: 1,),
            SizedBox(width: 10.0,),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: () {
                    Provider.of<ItemsOnSale>(context,listen: false).removeFromCart(item!);
                  },
                  icon: Icon(Icons.delete)),
            ),
          ],
        ),
      ),
    );
  }
}
