import 'package:flutter/material.dart';
import 'step_page_one.dart';
import 'step_page_two.dart';
import 'step_page_three.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStepper(),
    );
  }
}

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int currentStep = 0;
  int totalSteps = 3; // Total number of steps

  void goToNextStep() {
    setState(() {
      if (currentStep < totalSteps - 1) {
        currentStep++;
      } else {
        // If the current step reaches the total steps, navigate to the home page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomePage()), // Replace 'HomePage()' with your home page widget
        );
      }
    });
  }

  void goToPreviousStep() {
    setState(() {
      if (currentStep > 0) {
        currentStep--;
      }
    });
  }

  void setStep(int step) {
    currentStep = step;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          Row(children: [
            Container(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: goToPreviousStep,
                    child: Text(
                      (currentStep == 0) ? "" : 'ก่อนหน้า',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 74, 195, 153)),
                      textAlign: TextAlign.center,
                    ))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ขั้นที่ ${currentStep + 1} จาก $totalSteps',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ))),
            Container(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: goToNextStep,
                    child: const Text(
                      'ข้าม',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 74, 195, 153)),
                      textAlign: TextAlign.center,
                    )))
            // const Text(
            //   'ข้าม',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: LinearProgressIndicator(
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
              value: (currentStep + 1) / totalSteps,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 74, 195, 153)),
            ),
          ),
          Expanded(
            child: currentStep < totalSteps
                ? getPage(currentStep)
                : Container(), // Show empty container after the last step
          )
        ],
      ),
    );
  }

  Widget getPage(int step) {
    switch (step) {
      case 0:
        return StepPageOne(
          goToNextStep: () {
            // Function passed to StepPageOne to move to StepPageTwo
            goToNextStep();
          },
        );
      case 1:
        return StepPageTwo(goToNextStep: () {
          // Function passed to StepPageOne to move to StepPageTwo
          goToNextStep();
        });
      case 2:
        return StepPageThree(goToNextStep: () {
          // Function passed to StepPageOne to move to StepPageTwo
          goToNextStep();
        });
      // Add more cases for additional steps as needed
      default:
        return Container(); // Return an empty container if step is out of range
    }
  }
}
