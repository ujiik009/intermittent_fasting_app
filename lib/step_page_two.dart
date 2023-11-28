import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StepPageTwo extends StatefulWidget {
  final Function goToNextStep;

  const StepPageTwo({super.key, required this.goToNextStep});
  @override
  _StepPageTwoState createState() => _StepPageTwoState();
}

class _StepPageTwoState extends State<StepPageTwo> {
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'น้ำหนักของคุณคือ',
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Container(
                          alignment: Alignment.topCenter,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(52, 66, 208, 203),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: TextField(
                              controller: _weightController,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(151, 255, 255, 255)),
                              ),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          )),
                    ))
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Get the value from the TextField and assign it to the variable
                        String bodyWeight = _weightController.text;
                        // You can use the 'bodyHeight' variable as needed
                        print('Body Weight: $bodyWeight');
                        widget
                            .goToNextStep(); // Invoke the function to move to the next step
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 74, 195, 153),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      child: const Text('ถัดไป'),
                    )))
          ],
        ),
      ),
    );
  }
}
