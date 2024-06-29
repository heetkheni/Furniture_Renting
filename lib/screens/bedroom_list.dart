import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:odoo_hakathon/screens/bedroom_detail_screen.dart';

class BedroomScreen extends StatefulWidget {
  @override
  _BedroomScreenState createState() => _BedroomScreenState();
}

class _BedroomScreenState extends State<BedroomScreen> {
  String selectedSubcategory = 'All'; // Default selected subcategory

  void _selectSubcategory(String subcategory) {
    setState(() {
      selectedSubcategory = subcategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bedroom Products'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: ['All', 'Single Bed', 'Double Bed'].map((subcategory) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(subcategory),
                      selected: selectedSubcategory == subcategory,
                      onSelected: (bool selected) {
                        _selectSubcategory(subcategory);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: BedroomProductsList(selectedSubcategory: selectedSubcategory),
          ),
        ],
      ),
    );
  }
}

class BedroomProductsList extends StatelessWidget {
  final String selectedSubcategory;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  BedroomProductsList({required this.selectedSubcategory});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    Query query = _firestore.collection('courses').where('category', isEqualTo: 'Bedroom');

    if (selectedSubcategory != 'All') {
      query = query.where('subcategory', isEqualTo: selectedSubcategory);
    }

    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No products found'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.60, // Adjust the aspect ratio as needed
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var product = snapshot.data!.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BedroomDetailScreen(product: product.data() as Map<String, dynamic>),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        image: DecorationImage(
                          image: NetworkImage(product['imageUrl']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '₹${product['price']}', // Adding rupee symbol to the price
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            product['subcategory'], // Displaying subcategory
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
