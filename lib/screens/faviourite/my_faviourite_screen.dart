import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/faviourite_provider.dart';

class MyFaviourite extends StatefulWidget {
  const MyFaviourite({Key? key}) : super(key: key);

  @override
  State<MyFaviourite> createState() => _MyFaviouriteState();
}

class _MyFaviouriteState extends State<MyFaviourite> {
  @override
  Widget build(BuildContext context) {
    final faviouriteProvider = Provider.of<FaviouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('my faviourite'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: faviouriteProvider.selectedItems.length,
                itemBuilder: (context, index) {
                  return Consumer<FaviouriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItems.contains(index)) {
                            value.removeSelectedItems(index);
                          } else {
                            value.setSelectedItems(index);
                          }

                          // selectedItems.add(index);
                          // setState(() {});
                        },
                        title: Text(
                          "Item " + index.toString(),
                        ),
                        trailing: value.selectedItems.contains(index)
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
