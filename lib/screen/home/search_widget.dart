import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/home/search/search_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.search, color: Colors.black,),
            ),
            Text('در'),
            SizedBox(
              // height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 2,
                ),
                child: Text(
                  'سیوان لند',
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 24,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ),
            Text('بیاب'),
          ],
        ),
      ),
    );
  }
}
