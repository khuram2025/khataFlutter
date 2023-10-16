import 'package:flutter/material.dart';

class CustomerDetails extends StatelessWidget {
  final String customerName;

  CustomerDetails({required this.customerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Customer Image or Initial
                CircleAvatar(
                  backgroundImage: AssetImage('path_to_image'),  // If you have an image, use it here
                  child: Text(customerName[0].toUpperCase()),  // Display initial if no image
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            customerName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          Row(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  // Handle edit action here
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.green),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.green),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              OutlinedButton(
                                onPressed: () {
                                  // Handle delete action here
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.redAccent),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Customer Level: Level1',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Text('Since: 10 Jan 2020'),
                      Text(
                        'Credit Balance: Rs. 50000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Transactions',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 10,  // Placeholder for number of transactions
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text('Date: 10 Jan 2020'),  // Placeholder for date
                        subtitle: Text('Amount: Rs. 5000'),  // Placeholder for amount
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                // Handle edit action here
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Handle delete action here
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey[300]),
                    ],
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Total Customer Balance: Rs. 50000',  // Placeholder for total balance
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
