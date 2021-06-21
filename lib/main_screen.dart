import 'package:flutter/material.dart';
import 'package:submission/detail_screen.dart';
import 'package:submission/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wisata Sukabumi"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: _generateContainers(context),
        ));
  }

  List<Widget> _generateContainers(BuildContext context) {
    return List<Widget>.generate(tourismPlaceList.length, (index) {
      final TourismPlace place = tourismPlaceList[index];
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen(place);
          }));
        },
        child: Card(
          margin: EdgeInsets.all(10.0),
          elevation: 15,
          child: Column(
            children: [
              Container(
                child: Image.network(place.imageAsset),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      place.name,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
