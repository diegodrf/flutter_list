import 'package:flutter/material.dart';
import 'package:flutter_list/components/search_bar.dart';
import 'package:flutter_list/locations.dart';

main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  const SearchBar(),
                  const SizedBox(height: 10.0),
                  const Divider(
                    height: 5.0,
                    thickness: 1.0,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      final location = locations[index];

                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              height: 80.0,
                              width: 80.0,
                              color: Colors.grey,
                              child: const Icon(Icons.image),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(location.name),
                                Text('${location.city}, ${location.country}'),
                                Row(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                        Icon(Icons.star),
                                      ],
                                    ),
                                    Text('Reviews(${location.reviews})'),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 60.0,
                              width: 30.0,
                              color: Colors.grey,
                              child: const Icon(Icons.arrow_right),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
