import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BedroomDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  BedroomDetailScreen({required this.product});

  @override
  State<BedroomDetailScreen> createState() => _BedroomDetailScreenState();
}

class _BedroomDetailScreenState extends State<BedroomDetailScreen> {
  late Razorpay _razorPay;

  @override
  void initState() {
    super.initState();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
  }

  @override
  void dispose() {
    _razorPay.clear();
    super.dispose();
  }

  Future<void> _rentProduct(String productId, BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('rented_items').add({
        'productId': productId,
        'userId': user.uid,
        'duration': 30, // Default duration in days
        'rentedAt': Timestamp.now(),
      });
    } catch (e) {
      print('Error renting product: $e');
    }
  }

  void openCheckout(int amount) async {
    int convertedAmount = amount * 100; // Converting amount to paise (Razorpay expects paise)
    
    var options = {
      'key': 'rzp_test_IWJTu0Y4Q5oJxd', // Replace with your Razorpay Key
      'amount': convertedAmount,
      'name': 'Rentify',
      'description': 'Payment for ${widget.product['name']}',
      'prefill': {'contact': '1234567890', 'email': 'heetkhenifirebase@gmail.com'},
      'external': {
        'wallets': ['paytm', 'gpay']
      }
    };

    try {
      _razorPay.open(options);
    } catch (e) {
      print('Error during Razorpay checkout: $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Successful. Payment ID: ${response.paymentId}",
        toastLength: Toast.LENGTH_SHORT);
    // Handle success here
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failed. Error: ${response.message}", toastLength: Toast.LENGTH_SHORT);
    // Handle error here
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet Selected: ${response.walletName}", toastLength: Toast.LENGTH_SHORT);
    // Handle external wallet selection here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        backgroundColor: Color(0xff079dab),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.product['imageUrl']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.product['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '₹${widget.product['price']}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.product['subcategory'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A comfortable single bed with a modern design.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Material',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Wood',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Dimensions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '200cm x 90cm x 50cm',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // Add more details here as needed
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0), // Padding around the button
            width: double.infinity, // Button spans the width of the screen
            child: ElevatedButton(
              onPressed: () {
                int amount = int.parse(widget.product['price'].toString());
                _rentProduct("MKEiwaC3bi0AFGvXicQT", context);
                openCheckout(amount);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff079dab),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust button border radius as needed
                ),
              ),
              child: Text(
                'Rent Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

