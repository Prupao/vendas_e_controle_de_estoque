import 'dart:io';
import 'calculation_functions/calculation_functions.dart';
import 'controle_de_estoque/controle_de_estoque.dart';
import 'exibir_functions/exibir_functions.dart';
import 'produtos/produtos.dart';
import 'vendas/adicionar_vendas.dart';
import 'vendas/controle_de_vendas/controle_de_vendas.dart';
import 'vendas/venda.dart';
import 'produtos/produto.dart';
import 'vendas/vendas_produtos.dart';
import 'menus_utilizados/menus.dart';

int? option;
var listProduct = <Produto>[];
var listVenda = <Venda>[];
var listSalesAndProduct = <Controle>[];

var adicionarProdutos = AddProdutos();
var adicionarVendas = AddVendas();
var calcFunctions = Calc();
var estoque = Control();
var salesControl = ControleDeVendas();

void main(){
  while(option != 4){
    try{
      Menus.menu();
      option = int.parse(stdin.readLineSync()!);
      switch(option){
        case 1:
          adicionarProdutos.addProdutos(listProduct);
          break;
        case 2:
          adicionarVendas.Addsale(listProduct, listVenda, calcFunctions, estoque, listSalesAndProduct, salesControl);
          break;
        case 3:
          print('=*' * 12);
          print('---PRODUTOS---');
          Exibir.exibirProdutos(listProduct);
          print('=*' * 12);
          print('---VENDAS---');
          Exibir.exibirVendas(listVenda, listSalesAndProduct);
          print('=*' * 12);
          break;
        default:
          calcFunctions.totalCompra(listSalesAndProduct);
          print('SAINDO...');
          break;
      }
    }catch(e){
      print('=#' * 10);
      //rethrow;
    }
  }
}