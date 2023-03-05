import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider/faviourite_provider.dart';
import 'package:provider1/screens/faviourite/my_faviourite_screen.dart';

class FaviouriteScreen extends StatefulWidget {
  const FaviouriteScreen({Key? key}) : super(key: key);

  @override
  State<FaviouriteScreen> createState() => _FaviouriteScreenState();
}

class _FaviouriteScreenState extends State<FaviouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Faviourite example'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFaviourite(),
                ),
              );
            },
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
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
