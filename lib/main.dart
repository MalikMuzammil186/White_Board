import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_white_bord_with_bloc/Pages/loaded_page.dart';
import 'package:flutter_white_bord_with_bloc/bloc/bord_bloc.dart';
import 'package:flutter_white_bord_with_bloc/bloc/white_bord_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:BlocProvider(create: (BuildContext context) { 
        return WhiteBordBloc();
       },
      child: const MyHomePage(title: 'White Board ')),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),centerTitle: true,
      ),
      body: BlocBuilder<WhiteBordBloc,WhiteBordState>(builder: (context, state) {
        if (state is IntitalWhiteBordState) {
          return const  MuButton();
        }
        else if(state is LoadedWhiteBordState ){
          return const LoadedPage();
        }
        return const  SizedBox(height: 0,width: 0,);
        
      },),
      
    );
  }
}


class MuButton extends StatelessWidget {
  const MuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        context.read<WhiteBordBloc>().add(LoadedEvent());
      }
      , child:const Icon(Icons.draw) ),
    );
  }
  
}
