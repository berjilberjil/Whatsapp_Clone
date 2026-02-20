import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsin/screens/bottomnavbar.dart';
import 'package:whatsin/styles/color.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final TextEditingController _phoneController = TextEditingController();
  String _country = 'India';

  final Map<String, String> _countryCodes = const {
    'India': '+91',
    'United States': '+1',
    'United Kingdom': '+44',
    'Canada': '+1',
    'Australia': '+61',
  };

  void _continue() {
    final phone = _phoneController.text.trim();
    if (phone.length < 8) {
      Get.snackbar('Invalid number', 'Please enter a valid phone number.');
      return;
    }
    Get.offAll(const BottomNavBarWidget());
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        backgroundColor: AppColors.appBar,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'WhatsApp will need to verify your phone number.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 18),
            DropdownButtonFormField<String>(
              value: _country,
              decoration: const InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(),
              ),
              items: _countryCodes.keys
                  .map(
                    (country) => DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _country = value);
                }
              },
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixText: '${_countryCodes[_country]} ',
                labelText: 'Phone number',
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.whatsappGreen,
                  foregroundColor: Colors.black,
                ),
                onPressed: _continue,
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
