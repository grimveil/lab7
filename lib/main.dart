import 'package:flutter/material.dart';

void main() {
  runApp(const RGBColorPickerApp());
}

class RGBColorPickerApp extends StatelessWidget {
  const RGBColorPickerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB Color Picker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ColorPickerScreen(),
    );
  }
}

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({Key? key}) : super(key: key);

  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  double _red = 0;
  double _green = 0;
  double _blue = 0;

  Color get _currentColor => Color.fromRGBO(
    _red.toInt(),
    _green.toInt(),
    _blue.toInt(),
    1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RGB Color Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Відображення поточного кольору
            Container(
              height: 150,
              width: double.infinity,
              color: _currentColor,
              alignment: Alignment.center,
              child: Text(
                'RGB(${_red.toInt()}, ${_green.toInt()}, ${_blue.toInt()})',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Слайдер для Red
            _buildSlider(
              label: 'Red',
              value: _red,
              color: Colors.red,
              onChanged: (value) => setState(() => _red = value),
            ),
            // Слайдер для Green
            _buildSlider(
              label: 'Green',
              value: _green,
              color: Colors.green,
              onChanged: (value) => setState(() => _green = value),
            ),
            // Слайдер для Blue
            _buildSlider(
              label: 'Blue',
              value: _blue,
              color: Colors.blue,
              onChanged: (value) => setState(() => _blue = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required Color color,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toInt()}'),
        Slider(
          value: value,
          min: 0,
          max: 255,
          activeColor: color,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
