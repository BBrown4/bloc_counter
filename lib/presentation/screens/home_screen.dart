import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:bloc_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Decrement
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () =>
                      BlocProvider.of<CounterCubit>(context).decrement(),
                  tooltip: 'Decrement',
                  child: Icon(
                    Icons.remove,
                  ),
                  backgroundColor: widget.color,
                ),
                // Increment
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () =>
                      BlocProvider.of<CounterCubit>(context).increment(),
                  tooltip: 'Increment',
                  child: Icon(
                    Icons.add,
                  ),
                  backgroundColor: widget.color,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () => Navigator.of(context).pushNamed('/second'),
              child: Text(
                'Go to second screen',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.lightGreen,
              onPressed: () => Navigator.of(context).pushNamed('/third'),
              child: Text(
                'Go to third screen',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
