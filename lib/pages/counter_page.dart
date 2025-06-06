import 'package:flutter/material.dart';
import 'package:semana6_7/providers/counter.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Exemplo contador", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {  
              CounterProvider.of(context)?.state.inc();
              print(CounterProvider.of(context)?.state.value.toString());
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.dec();
                print(CounterProvider.of(context)?.state.value.toString());
              });
            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
