import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentItem = '';
  List<String> items = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Adils List View'),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(items[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    items.removeAt(index);
                  });
                },
              ),
            ),
            itemCount: items.length,
          ),
        ),
        Row(
          children: [
            Expanded(child: TextField(
              onChanged: (String data) {
                currentItem = data;
              },
            )),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (currentItem.isNotEmpty) items.add(currentItem);
                  });
                },
                icon: const Icon(Icons.add))
          ],
        )
      ],
    ));
  }
}
