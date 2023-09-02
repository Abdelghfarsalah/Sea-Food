import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:seefood/models/foodmodel.dart';

part 'detilsfood_state.dart';

class DetilsfoodCubit extends Cubit<DetilsfoodState> {
  DetilsfoodCubit() : super(DetilsfoodInitial());
  late modelfood model;
  List<modelfood> listfoodcart=[];

  void addcard({required modelfood model,required int numder }){
    
    for(int i=0;i<numder;i++)
    {
      listfoodcart.add(model);
    
    }
    emit(addcardsuccess());
  }
  

  void removecard({required int index}){
  listfoodcart.removeAt(index);
  emit(removesuccess());
  }
}
