import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Yigzu Electronics'),
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: ClipOval(
              child: Container(
                height: 250, // Set the desired height for the image
                width: 250,  // Set the desired width for the image to make it circular
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/pc.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // SizedBox to give some space between image and card
          SizedBox(height: 30),
          // Container as a Card
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 210,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Inchis"),
                          Text("32"),
                          Text("42"),
                          Text("64"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


