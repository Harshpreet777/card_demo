import 'package:card_demo/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var items = ["Item 1", "Item 2", "Item 3"];

  String initialValue = "Item 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Card(
      color: Colors.black,
      elevation: 20,
      shadowColor: Colors.black,
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            title: Text(
              'Batman',
              style: TextStyleConstants.openSans12Font500W
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            subtitle: const Text(
              'Sponsored',
              style: TextStyleConstants.openSans12Font500W,
            ),
            leading: CircleAvatar(
              maxRadius: 30,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.yellow])),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: null,
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://cdn.iconscout.com/icon/premium/png-512-thumb/avatar-136-116502.png?f=webp&w=512',
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ),
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(child: Text('Item 1')),
                  PopupMenuItem(child: Text('Item 2')),
                  PopupMenuItem(child: Text('Item 3'))
                ];
              },
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
          Image.network(
            'https://rukminim2.flixcart.com/image/850/1000/l05lx8w0/poster/1/h/0/medium-batman-logo-dc-batman-symbol-batman-logo-poster-print-on-original-imagcyczj9tbc5ge.jpeg?q=90',
          ),
           ListTile(
            tileColor: Colors.pink,
            trailing:  DropdownButton(
              icon: const Icon(Icons.arrow_downward_sharp,color: Colors.white,),
              value: initialValue,
              items: items.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            }).toList(), onChanged: (changedVal){
                 setState(() {
                   initialValue = changedVal ?? "";
                 });    
            }),
            leading:const Text(
              'Install Now',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_outward_rounded,
                      color: Colors.white,
                    )),
              ],
            ),
            trailing: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                )),
          ),
          const ListTile(
            title: Text(
              "I AM BATMAN!!!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Widget commonText(String text) {
    return Text(text);
  }
}
