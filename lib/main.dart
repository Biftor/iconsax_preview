import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_preview/iconsax_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IconSax Preview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = IconSaxData().icons;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 12 : 6,
            ),
            itemCount: icons.length,
            itemBuilder: (BuildContext context, int index) {
              IconData icon = icons[index];
              return IconButton(
                onPressed: () {
                  String dataToCopy =
                      "Number: $index\ndecimal: ${icon.codePoint}\nfull: $icon";
                  Clipboard.setData(ClipboardData(text: dataToCopy));
                  final snackBar = SnackBar(
                    content: Text('Icon data copied to clipboard'),
                    duration: Duration(milliseconds: 250),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icon),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      index.toString(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
