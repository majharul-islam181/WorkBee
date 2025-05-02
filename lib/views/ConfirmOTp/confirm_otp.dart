import 'package:flutter/material.dart';

class ConfirmationCodePage extends StatefulWidget {
  const ConfirmationCodePage({super.key});

  @override
  State<ConfirmationCodePage> createState() => _ConfirmationCodePageState();
}

class _ConfirmationCodePageState extends State<ConfirmationCodePage> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool _isAllFilled = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_checkFilled);
    }
  }

  void _checkFilled() {
    bool filled = _controllers.every((controller) => controller.text.isNotEmpty);
    setState(() {
      _isAllFilled = filled;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < _focusNodes.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter confirmation code",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "A 4-digit code was sent to lucasscott3@email.com",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // Change email action
                },
                child: const Text(
                  "Change email",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 32),

              // OTP Input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (value) => _onOtpChanged(index, value),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 32),

              Center(
                child: Text(
                  "Haven't received code yet?",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    // Resend code action
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "Resend code",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isAllFilled
                      ? () {
                          // Submit action
                          print("OTP submitted: ${_controllers.map((e) => e.text).join()}");
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isAllFilled ? Colors.blue : Colors.blue.shade100,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
