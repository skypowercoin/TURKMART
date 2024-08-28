import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          // Payment method selection
          DropdownButtonFormField<String>(
            value: 'Credit card',
            items: const [
              DropdownMenuItem(
                child: Text('Credit card'),
                value: 'Credit card',
              ),
              DropdownMenuItem(
                child: Text('Debit card'),
                value: 'Debit card',
              ),
              DropdownMenuItem(
                child: Text('PayPal'),
                value: 'PayPal',
              ),
              DropdownMenuItem(
                child: Text('Apple Pay'),
                value: 'Apple Pay',
              ),
              DropdownMenuItem(
                child: Text('Google Pay'),
                value: 'Google Pay',
              ),
            ],
            onChanged: (value) {
              setState(() {
                ///_paymentMethod = value!;
              });
            },
          ),

          // Credit card details
          Visibility(
            visible: true, ///_paymentMethod == 'Credit card',
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Card number',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Expiration date',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                  ),
                ),
              ],
            ),
          ),

          // Debit card details
          Visibility(
            visible: true,/// _paymentMethod == 'Debit card',
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Card number',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Expiration date',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                  ),
                ),
              ],
            ),
          ),

          // PayPal details
          Visibility(
            visible:  true,////_paymentMethod == 'PayPal',
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),

          // Apple Pay details
          Visibility(
            visible: true,/// _paymentMethod == 'Apple Pay',
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Apple ID',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),

          // Google Pay details
          Visibility(
            visible:  true,///_paymentMethod == 'Google Pay',
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Google account',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),

          // Submit button
          ElevatedButton(
            onPressed: () {
              // Process payment
            },
            child: const Text('Pay'),
          ),
        ],
      ),
    );
  }
}