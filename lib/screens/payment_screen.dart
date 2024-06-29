import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayDemoScreen extends StatefulWidget {
  @override
  _RazorpayDemoScreenState createState() => _RazorpayDemoScreenState();
}

class _RazorpayDemoScreenState extends State<RazorpayDemoScreen> {
  late Razorpay _razorpay;
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Successful: ${response.paymentId}");
    // Handle successful payment response
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Error: ${response.message}");
    // Handle payment failure
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External Wallet: ${response.walletName}");
    // Handle external wallet selected
  }

  void _openCheckout() {
    var options = {
      'key': 'rzp_test_IWJTu0Y4Q5oJxd', // Replace with your Razorpay API key
      'amount': int.parse(_amountController.text.trim()) * 100,
      'name': 'Demo App',
      'description': 'Test Payment',
      'prefill': {'contact': '1234567890', 'email': 'test@example.com'},
      'theme': {
        'color': '#F37254' // Replace with your theme color
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _openCheckout,
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}

