import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class StepCountScreen extends StatefulWidget {
  const StepCountScreen({super.key});

  @override
  _StepCountScreenState createState() => _StepCountScreenState();
}

class _StepCountScreenState extends State<StepCountScreen> {
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;
  String _status = 'Not Pedometer'; // To display permission status or errors

  @override
  void initState() {
    super.initState();

    _requestPermissionAndInitPedometer();
  }
  Future<void> _requestPermissionAndInitPedometer() async {
    PermissionStatus status = await Permission.activityRecognition.request();

    if (status.isGranted) {
      setState(() {
        _status = 'Pedometer Active';
      });
      //_initPedometer();
      initPadometer();
    } else if (status.isDenied) {
      setState(() {
        _status = 'Permission Denied. Please grant access to activity recognition.';
      });
      // Optionally, show a dialog to explain why the permission is needed
      // and provide a button to open app settings.
    } else if (status.isPermanentlyDenied) {
      setState(() {
        _status = 'Permission Permanently Denied. Please enable it in app settings.';
      });
      // Guide user to app settings
      await openAppSettings();
    } else {
      setState(() {
        _status = 'Permission status: $status';
      });
    }
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 0; // Or handle the error appropriately
    });
  }

  void initPadometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Steps Taken:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$_steps',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              _status, // Display status or error messages
              style: TextStyle(fontSize: 16, color: _status.contains('Error')|| _status.contains('Denied') ? Colors.red : Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            if (_status.contains('Denied')) // Show a button to retry permission if denied
              ElevatedButton(
                onPressed: _requestPermissionAndInitPedometer,
                child: Text('Retry Permission'),
              ),
          ],
        ),
      ),
    );
  }
}