import 'package:flutter/material.dart';
import 'dart:math';

import 'package:untitled5/widgets/customerDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MobileLayout(),
    );
  }
}

class CenterColumnContent extends StatefulWidget {
  @override
  _CenterColumnContentState createState() => _CenterColumnContentState();
}

class _CenterColumnContentState extends State<CenterColumnContent> {
  bool isCustomerActive = true;
  final List<Customer> customers = List.generate(10, (index) => Customer(name: 'Customer $index', amount: 500900.0 + Random().nextInt(1000)));
  void _showCustomerDetails(String customerName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomerDetails(customerName: customerName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lightColors = [
      Colors.blue[100]!,
      Colors.red[100]!,
      Colors.green[100]!,
      Colors.yellow[100]!,
      Colors.purple[100]!,
    ];

    return Column(
      children: [
        // Customers & Supplier with specified styles
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isCustomerActive = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isCustomerActive ? Color(0xFFd1e9ff) : Color(0xFFf5f5f5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Customers',
                    style: TextStyle(
                      color: isCustomerActive ? Color(0xFF175cd3) : Color(0xFF000000).withOpacity(0.6),
                      fontSize: 13.6,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30.0),  // Space between
              InkWell(
                onTap: () {
                  setState(() {
                    isCustomerActive = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: !isCustomerActive ? Color(0xFFd1e9ff) : Color(0xFFf5f5f5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Supplier',
                    style: TextStyle(
                      color: !isCustomerActive ? Color(0xFF175cd3) : Color(0xFF000000).withOpacity(0.6),
                      fontSize: 13.6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Search Box, Filter Icon, and View Report button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name or Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                alignment: Alignment.center,
                child: Icon(Icons.filter_list, size: 24.0, color: Color(0xFFB19CD9)),  // Using the light purple color
              ),
              SizedBox(width: 10.0),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 50,  // Adjusted height
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFB19CD9)),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  'View Report',
                  style: TextStyle(color: Color(0xFFB19CD9)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        // Table Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Name', style: TextStyle(color: Colors.grey[700], fontSize: 18)),
                Text('Amount', style: TextStyle(color: Colors.grey[700], fontSize: 18)),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        // Customers List
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: customers.map((customer) {
              int colorIndex = customers.indexOf(customer) % lightColors.length;
              return GestureDetector(
                onTap: () => _showCustomerDetails(customer.name),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: lightColors[colorIndex],
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(customer.name[0].toUpperCase(), style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(customer.name),
                                Text('15 Oct 2023', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        Text('Rs. ${customer.amount.toStringAsFixed(2)}'),
                      ],
                    ),
                    Divider(color: Colors.black12),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class Customer {
  final String name;
  final double amount;

  Customer({required this.name, required this.amount});
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          child: ListView(
            children: [
              ListTile(title: Text('Menu Item 1')),
              ListTile(title: Text('Menu Item 2')),
              ListTile(title: Text('Menu Item 3')),
              ListTile(title: Text('Menu Item 4')),
              ListTile(title: Text('Menu Item 5')),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: CenterColumnContent(),
      ),
    );
  }
}