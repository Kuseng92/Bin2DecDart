import 'package:flutter/material.dart';

void main() {
  runApp(const Bin2DecApp());
}

class Bin2DecApp extends StatelessWidget {
  const Bin2DecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bin2Dec Converter',
      home: Bin2DecScreen(),
    );
  }
}

class Bin2DecScreen extends StatefulWidget {
  const Bin2DecScreen({super.key});

  @override
  Bin2DecScreenState createState() => Bin2DecScreenState();
}

class Bin2DecScreenState extends State<Bin2DecScreen> {
  String binaryInput = '';
  String decimalOutput = '';

  void convertBin2Dec(String input) {
    int decimal = 0;
    int power = 0;
    for (int i = input.length - 1; i >= 0; i--) {
      if (input[i] == '1') {
        decimal += (1 << power);
      } else if (input[i] != '0') {
        // Invalid input, notify the user
        setState(() {
          decimalOutput = 'Invalid Input';
        });
        return;
      }
      power++;
    }
    setState(() {
      decimalOutput = decimal.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bin2Dec Converter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter up to 8 binary digits',
                ),
                onChanged: (value) {
                  if (value.length <= 8) {
                    binaryInput = value;
                    convertBin2Dec(binaryInput);
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Decimal Equivalent:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                decimalOutput,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
