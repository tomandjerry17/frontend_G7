import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryIndex = 0;
  List<List<int>> productCounts =
      List.generate(5, (index) => List.generate(9, (index) => 0));

  final List<String> categories = [
    'Noodles',
    'Snacks',
    'Biscuits',
    'Junk Foods',
    'Soft Drinks',
  ];

  final List<List<String>> products = [
    [
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 1',
      'Product 2',
      'Product 3'
    ],
    [
      'Product 4',
      'Product 5',
      'Product 6',
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 1',
      'Product 2',
      'Product 3'
    ],
    [
      'Product 7',
      'Product 8',
      'Product 9',
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 1',
      'Product 2',
      'Product 3'
    ],
    [
      'Product 10',
      'Product 11',
      'Product 12',
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 1',
      'Product 2',
      'Product 3'
    ],
    [
      'Product 13',
      'Product 14',
      'Product 15',
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 1',
      'Product 2',
      'Product 3'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.green[50], // Set the background color to light green
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[900], // Keep AppBar color green
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://placehold.co/100x100'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Store Manager'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.green[100], // Keep sales report container color green
            child: Column(
              children: [
                Text(
                  'SALES REPORT',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('DATE: 02-07-2025'),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sales'),
                    Text('₱100.00'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Profit'),
                    Text('₱100.00'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'CATEGORIES',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedCategoryIndex == index
                          ? Colors
                              .green[300] // Keep selected category color green
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          'https://placehold.co/50x50',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 4),
                        Text(
                          categories[index],
                          style: TextStyle(
                              color:
                                  Colors.green[900]), // Keep text color green
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          // Add the "PRODUCTS" label here
          Text(
            'PRODUCTS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: products[selectedCategoryIndex].length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      productCounts[selectedCategoryIndex][index]++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // Change product container color to white
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://placehold.co/100x100',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 4),
                              Text(products[selectedCategoryIndex][index]),
                            ],
                          ),
                        ),
                        if (productCounts[selectedCategoryIndex][index] > 0)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors
                                    .green[900], // Change badge color to green
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  productCounts[selectedCategoryIndex][index]
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.green[900], // Keep bottom navigation bar color green
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: 0, // Set the current index to highlight the selected page
        onTap: (index) {
          // Disable navigation if the current page is already open
          if (index == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You are already on the Dashboard page.'),
                duration: Duration(seconds: 1),
              ),
            );
          } else {
            // Handle navigation to other pages
            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => OtherPage()));
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
