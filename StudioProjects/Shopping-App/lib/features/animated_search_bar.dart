import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/AppData.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _shrink = true;
  TextEditingController? _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _shrink ? 56 : 350,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 5,
                        color: Colors.brown
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: kElevationToShadow[15],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only( topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                              color: Colors.brown[300],
                            ),
                        padding: const EdgeInsets.only(left: 16),
                        child: !_shrink ? TextField(
                          onChanged: (value) {
                            setState(() {
                              Provider.of<ItemsOnSale>(context,listen: false).ReturnSearchList(value);
                              Provider.of<ItemsOnSale>(context,listen: false).GetNameOfSearchListItem();
                            });
                          },
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            hintText: 'Search for products',
                            hintStyle: TextStyle(
                              color: Colors.white
                            ),
                            border: InputBorder.none
                          ),
                        ) : null,
                      )
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // Applying a splash on click
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(_shrink ? 32 : 0),
                              topRight: Radius.circular(32),
                              bottomLeft: Radius.circular(_shrink ? 32 : 0),
                              bottomRight: Radius.circular(32),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0),
                              child: Icon(
                                  _shrink ? Icons.search : Icons.close,
                                  color: Colors.brown,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _shrink = !_shrink;
                              });
                            },
                          ),
                        ),)
                    ],
                  ),
                ),
            const SizedBox(width: 10,),
            const Text('SEARCH')
          ],
        ),
        SizedBox(
            height: 50,
            child: _textEditingController!.text.isEmpty ? null : SearchList()),
      ],
    );
  }
}

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsOnSale>(
        builder: (context, lists,child)  {
          bool search_list_is_empty = lists.search_list.isEmpty;
          return search_list_is_empty ?
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Container(height: 30,color: Colors.brown, width: 300,
                  child: const Text('No result available', textAlign: TextAlign.center,),)),
          )
              : Padding(
                padding: const EdgeInsets.only(
                    left: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                  itemCount: lists.nameOfSearchListItem.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.brown,
                      child: Row(
                        children: [
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 8.0),
                            child: Text(
                                lists.nameOfSearchListItem[index],
                            style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),),
                          )
                        ],
                      ),
                    );
          }),
                ),
              );
        } );
  }
}

