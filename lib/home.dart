import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// enum MyCountry {'USA', 'Canada', 'Singapore', 'India', 'China', 'Japan', South Korea};

class _HomeState extends State<Home> {
  final TextEditingController countryController = TextEditingController();

  final _countries = ['USA', 'Canada', 'Singapore', 'India', 'China', 'Japan', 'South Korea'];

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DialogBox')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _dialogBuilder(context),
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }



  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        // return openDialogBox();
        return AlertDialog(
          title: const Text('Select Country'),
          content: myListView(),
          actions: [
            ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('cancel')),
            ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('ok')),
          ],
        );
        // return myCustomAlertDialog();
      },
    );
  }

  Widget myListView() {
    return ListView.builder(
      itemCount: _countries.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Text(_countries[index]),
          value: _countries[index],
          groupValue: selectedCountry,
          onChanged: (String? val) {
            setState(() {
              selectedCountry=val;
              debugPrint(selectedCountry);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }
}