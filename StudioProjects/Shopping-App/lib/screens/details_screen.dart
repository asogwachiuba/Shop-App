import 'package:flutter/material.dart';
import 'package:shopping_app/screens/AppData.dart';

class DetailsScreen extends StatefulWidget {
  Items? item;
  DetailsScreen({
    required this. item,
    Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${widget.item!.image}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all( Radius.circular(20)),
                color: Colors.white,
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
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 5,
                                  color: Colors.brown
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/${widget.item!.image}'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                       Spacer(flex: 1,),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0),
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                            ),
                            child: Text(
                              '₦ ${widget.item!.price}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(
                    left: 5,
                    top: 35,
                  ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 170,
                            ),
                            child: Text('${widget.item!.name}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),),
                          ),
                          const SizedBox(height: 50.0,),
                          Text(' Category : ${widget.item!.category}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          Spacer(flex: 1,),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  IconButton(
                                    // 1
                                    icon: Icon(widget.item!.favorite ? Icons.favorite : Icons.favorite_border),
                                    iconSize: 50,
                                    // 2
                                    color: Colors.red[400],
                                    onPressed: () {},
                                  ),
                                  SizedBox(width: 20,),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: MaterialButton(
                                      textColor: Colors.white,
                                      child: const Text('Add to Cart'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.red,
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
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
