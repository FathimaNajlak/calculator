import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Import the math expressions package for evaluation

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String displayText = '0'; // Display text to show inputs/results

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                displayText,
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: _buildButtonGrid(), // Build calculator buttons
          ),
        ],
      ),
    );
  }

  Widget _buildButtonGrid() {
    return GridView.count(
      crossAxisCount: 4, // 4 buttons per row
      children: <Widget>[
        _buildButton('7'),
        _buildButton('8'),
        _buildButton('9'),
        _buildButton('/'),
        _buildButton('4'),
        _buildButton('5'),
        _buildButton('6'),
        _buildButton('*'),
        _buildButton('1'),
        _buildButton('2'),
        _buildButton('3'),
        _buildButton('-'),
        _buildButton('C'),
        _buildButton('0'),
        _buildButton('='),
        _buildButton('+'),
      ],
    );
  }

  Widget _buildButton(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onButtonPressed(label); // Handle button press
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(String label) {
    if (label == 'C') {
      displayText = '0'; // Clear display
    } else if (label == '=') {
      try {
        final expression = displayText;
        displayText = _evaluateExpression(expression); // Evaluate expression
      } catch (e) {
        displayText = 'Error';
      }
    } else {
      if (displayText == '0') {
        displayText = label;
      } else {
        displayText += label;
      }
    }
  }

  String _evaluateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  }
}
