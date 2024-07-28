import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigiSort',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () { 
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage(title: '',)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/digisort.png', height: 120,),
            const SizedBox(height: 20,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )

          ],
        ),
      ),
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //this controller is to get ther user type
  final _textController = TextEditingController();
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  final _textController4 = TextEditingController();

  //store sortedList
  String sortedList = " ";

  void selectionSort() {

    //convert string to int 
    int num = int.parse(_textController.text);
    int num1 = int.parse(_textController1.text);
    int num2 = int.parse(_textController2.text);
    int num3 = int.parse(_textController3.text);
    int num4 = int.parse(_textController4.text);

    List<int> numberlist = [];

    numberlist.add(num);
    numberlist.add(num1);
    numberlist.add(num2);
    numberlist.add(num3);
    numberlist.add(num4);

  var n = numberlist.length;
  for (var i = 0; i < n - 1; i++) {
    var indexMin = i;
    for (var j = i + 1; j < n; j++) {
      if (numberlist[j] < numberlist[indexMin]) {
        indexMin = j;
      }
    }
    if (indexMin != i) {
      var temp = numberlist[i];
      numberlist[i] = numberlist[indexMin];
      numberlist[indexMin] = temp;
    }
    sortedList = numberlist.join(","); //convert int list to string separated by a comma
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('DigiSort'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //display result
            Expanded(
              child: Container(
                child: Center(
                  child: Text(sortedList, 
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 40)
                  ),
                ),
              ),
            ),

            //text input
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              decoration:  InputDecoration(
                hintText: 'Enter 1st integer number',
                border: const OutlineInputBorder(),
                
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),

            TextField(
              controller: _textController1,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              decoration:  InputDecoration(
                hintText: 'Enter 2nd integer number',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController1.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            TextField(
              controller: _textController2,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              decoration:  InputDecoration(
                hintText: 'Enter 3rd integer number',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController2.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            TextField(
              controller: _textController3,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              decoration:  InputDecoration(
                hintText: 'Enter 4th integer number',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController3.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            TextField(
              controller: _textController4,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              decoration:  InputDecoration(
                hintText: 'Enter 5th integer number',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController4.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            
          Padding(
              padding: const EdgeInsets.all(20),
            //sort button
            child: MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 100,
              height: 50,
              onPressed: () {
                setState(() {
                  selectionSort();
                });
              },
              color: Colors.orange,
              child: const Text('Sort', 
              style: TextStyle(
                color: Colors.white)), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
