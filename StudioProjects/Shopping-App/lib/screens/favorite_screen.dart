import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/app_theme.dart';
import 'AppData.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 20,
      title: Text(
      'FAVORITE PRODUCTS',
      style: GoogleFonts.lato(fontWeight: FontWeight.w600),
    ),
    ),
    body:Container(
      color: Colors.black,
      child: Consumer<ItemsOnSale>(
            builder: (context, favoriteList,child) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return FavotriteCard(item: favoriteList.favorite_list[index]);
                },
                itemCount: favoriteList.favorite_list.length,
                scrollDirection: Axis.vertical,);
            }
          ),
    ));
  }
}

class FavotriteCard extends StatelessWidget {
  Items? item ;
  FavotriteCard({
    required this.item,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
                width: 5,
                color: Colors.brown,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 100,
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/${item!.image}'),
              ),
              SizedBox(width: 20,),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 170
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item!.name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                    Text('Category : ${item!.category.toString()}'),
                    SizedBox(height: 10,),
                    Text('Price : ${item!.price}')
                  ],
                ),
              ),
              Spacer(flex: 1,),
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                    onPressed: () {
                      Provider.of<ItemsOnSale>(context,listen: false).addToCart(item!);
                    },
                    icon: Icon(Icons.add_shopping_cart_sharp)),
              ),
              SizedBox(width: 10.0,),
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                    onPressed: () {
                      Provider.of<ItemsOnSale>(context,listen: false).removeFromFavoriteList(item!);
                    },
                    icon: Icon(Icons.delete)),
              ),
            ],
          ),
        ),

      );
  }
}

