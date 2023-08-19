import 'package:api_fetching_flutter/api_service.dart';
import 'package:flutter/material.dart';

class DogInfoPage extends StatefulWidget {
  const DogInfoPage({super.key});

  @override
  State<DogInfoPage> createState() => _DogInfoPageState();
}

class _DogInfoPageState extends State<DogInfoPage> {
  late Future _future;

  @override
  void initState() {
    _future = getDogImage();
    super.initState();
  }

  void refresh() {
    setState(() {
      _future = getDogImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Image.network(
                      snapshot.data,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      refresh();
                    },
                    child: Text("Refresh"))
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Data cannot be loaded");
          } else {
            return Text("Failed to fetch api");
          }
        },
      ),
    );
  }
}
