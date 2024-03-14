import 'package:flutter/material.dart';
import 'package:flutter_white_bord_with_bloc/Size/larg_size_pen.dart';
import 'package:flutter_white_bord_with_bloc/Size/small_sie_pen.dart';

class LoadedPage extends StatefulWidget {
  const LoadedPage({super.key});

  @override
  State<LoadedPage> createState() => _LoadedPageState();
}

class _LoadedPageState extends State<LoadedPage> {

  int index=0;
  final _strokes=<Path>[];

  void _startStroke(double x,double y){
    _strokes.add(Path()..moveTo(x, y));
  }

  void _moveStroke(double x,double y){
    setState(() {
      _strokes.last.lineTo(x, y);
    });
  }

  void _indexdelete(){
    setState(() {
      _strokes.clear();
    });
  }

  void _indexdeleteposition (){
    setState(() {
     
    _strokes.removeLast();
    });
  }
  void _redoindex(){
    setState(() {
      var um=_strokes.removeLast();
     _strokes.addAll(um as Iterable<Path>);
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height)=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(onPanDown: (details) 
      => _startStroke(details.localPosition.dx, details.localPosition.dy),
      onPanUpdate: (details) =>
       _moveStroke(details.localPosition.dx, details.localPosition.dy),
      child:  SizedBox(width: width,
      height: height,
      child:CustomPaint(painter:SmallSizeStroke(strokes: _strokes),
      )),
      ),

      floatingActionButton:  Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            _indexdelete();
          },
          tooltip: "all remove",
          backgroundColor: Colors.green,
          child: const  Icon(Icons.remove),
          ),
          SizedBox(height: height*0.02,),
          FloatingActionButton(onPressed: (){
            _indexdeleteposition();
          },
          tooltip: 'undo',
          child:const Icon(Icons.undo_sharp) ,),
          FloatingActionButton(onPressed: (){
            _redoindex();
          },
          tooltip: 'Redo',
          child:const Icon(Icons.redo_rounded),)
        ],
      ),
      
    );
  }
}