import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/app_theme.dart';
import 'package:shopping_app/features/animated_search_bar.dart';
import 'AppData.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        SpecialOfferListView(
            list_of_special_offers:
            Provider.of<ItemsOnSale>(context,listen: false).special_offers),
        AvailableOffers(),
      ],
    );
  }
}
class SpecialOfferListView extends StatelessWidget {
  final List<Items> list_of_special_offers;
  const SpecialOfferListView({
    Key? key,
    required this.list_of_special_offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AnimatedSearchBar(),
          const Padding(
            padding: EdgeInsets.only(
              top: 20, left: 10.0),
            child: Text('SPECIAL OFFERS',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          ),
          const SizedBox(height: 15),
          Consumer<ItemsOnSale>(
        builder: (context, list, child) {
          return Container(
            height: 350,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Item = list.special_offers[index];
                  return SpecialOfferCard(item: Item);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 15);
                },
                itemCount: list.special_offers.length),
          );}
          ),
        ],
      ),
    );
  }
}



class SpecialOfferCard extends StatelessWidget {
  final Items item;
  const SpecialOfferCard({
    Key? key,
  required this.item, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: Colors.brown
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)
          ),
          image: DecorationImage(
            image: AssetImage('assets/${item.image}'),
            fit: BoxFit.cover,
          ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 130,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              ),
              color: Colors.white54,
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 8.0,),
                        child: Container(
                          child: Image.asset('assets/${item.image}'),
                          height: 85,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 70,
                        ),
                        child: Text(
                          '₦ ${item.price}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.only(
                      left: 5,
                      top: 0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 170,
                            ),
                            child: Text('${item.name}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('${item.category}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          const SizedBox(height: 5.0,),
                          Row(
                            children: [
                              IconButton(
                                // 1
                                icon: Icon(item.favorite ? Icons.favorite : Icons.favorite_border),
                                iconSize: 30,
                                // 2
                                color: Colors.red[400],
                                onPressed: () {
                                  Provider.of<ItemsOnSale>(context,listen: false).favoriteChangedFromSpecialOffers(item);
                                  Provider.of<ItemsOnSale>(context,listen: false).updateFavoriteList(item);
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: MaterialButton(
                                  textColor: Colors.white,
                                  child: const Text('Add to Cart'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.red,
                                  onPressed: () {
                                    Provider.of<ItemsOnSale>(context,listen: false).addToCart(item);
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),)
              ],
            ),
          ),
        ),
      )
    );
  }
}

class AvailableOffers extends StatefulWidget {
  const AvailableOffers({Key? key}) : super(key: key);


  @override
  State<AvailableOffers> createState() => _AvailableOffersState();
}

class _AvailableOffersState extends State<AvailableOffers> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemsOnSale>(context,listen: false).ReturnSelectedList('All');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsOnSale>(
      builder: (context, lists, child){
        return Column(
          children: [
            Container(
              height: 150,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(height: 40.0,),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0),
                        child: Text('AVAILABLE OFFERS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      )),
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const Text('CATEGORY :   ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),),
                          CategoryButton( category: 'All',),
                          CategoryButton( category: 'Sports',),
                          const SizedBox(width: 10,),
                          CategoryButton( category: 'Clothing',),
                          const SizedBox(width: 10,),
                          CategoryButton( category: 'Shoes',),
                          const SizedBox(width: 10,),
                          CategoryButton( category: 'Books',),
                          const SizedBox(width: 10,),
                          CategoryButton( category: 'Home Electronics',),
                          const SizedBox(width: 10,),
                          CategoryButton( category: 'Accessories',),
                          const SizedBox(width: 10,),
                          CategoryButton( category: 'Cosmetics',),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                primary: false,
                itemCount: lists.selected_offer_category.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3/5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2),
                    shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.black,
                      child: AvailableOfferCard(item: lists.selected_offer_category[index]));
                },),
            ),
          ],
        );
      },
    );
  }
}

class AvailableOfferCard extends StatefulWidget {
  final Items item;

  const AvailableOfferCard({
    required this.item,
    Key? key}) : super(key: key);

  @override
  State<AvailableOfferCard> createState() => _AvailableOfferCardState();
}

class _AvailableOfferCardState extends State<AvailableOfferCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 5,
                    color: Colors.brown
                ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('assets/${widget.item.image}'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 15.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [

                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
              height: 100,
              color: Colors.black,
              //color: Colors.blue,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 100,
                                ),
                                child: Text(widget.item.name.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),),
                              ),
                              Spacer(flex: 1),
                              IconButton(
                                  // 1
                                  icon: Icon(widget.item.favorite ? Icons.favorite : Icons.favorite_border),
                                  iconSize: 30,
                                  // 2
                                  color: Colors.red[400],
                                  onPressed: () {
                                    Provider.of<ItemsOnSale>(context,listen: false).favoriteChangedFromAvailableOffers(widget.item);
                                    Provider.of<ItemsOnSale>(context,listen: false).updateFavoriteList(widget.item);
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 1,),
                    Row(
                      children: [
                        SizedBox(width: 8.0,),
                        Text('₦ ${widget.item.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                        Spacer(flex: 1,),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                              textColor: Colors.white,
                              child: const Text('Add to Cart'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.red,
                              onPressed: () {
                                Provider.of<ItemsOnSale>(context,listen: false).addToCart(widget.item);
                              },
                            ),
                        ),
                      ],
                    ),],
                ),
            ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  String category;
   CategoryButton({
     required this.category,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ItemsOnSale>( context, listen: false)
            .ReturnSelectedList(category);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
              width: 4,
              color: Colors.brown
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Center(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Provider.of<ItemsOnSale>( context, listen: false)
                        .ReturnSelectedList(category);
                  },
                  iconSize: 25,
                  icon: const Icon(Icons.delete)),
              Text(category, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),),
              const SizedBox(width: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

