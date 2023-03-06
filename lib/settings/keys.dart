
import 'package:flutter/cupertino.dart';
import 'package:localstore/localstore.dart';

final db= Localstore.instance;

class Sizee<Size>{
 
  
  Sizee._();
  
  static width(BuildContext context){
    
    return MediaQuery.of(context).size.width;
    
  }


  static height(BuildContext context){

    return MediaQuery.of(context).size.height;

  }
  
  
}