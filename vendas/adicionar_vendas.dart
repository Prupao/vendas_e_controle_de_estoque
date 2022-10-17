import '../calculation_functions/calculation_functions.dart';
import '../controle_de_estoque/controle_de_estoque.dart';
import '../exibir_functions/exibir_functions.dart';
import '../produtos/produto.dart';
import 'controle_de_vendas/controle_de_vendas.dart';
import 'venda.dart';
import 'dart:io';

import 'vendas_produtos.dart';
class addVendas{

  int idVenda = 1;
  void Addsale(List<Produto>listProduct, List<Venda>listVenda, Calc calcFunctions, Control estoque, List<Controle>listSalesAndProduct, ControleDeVendas salesControl){
    var sales = Venda();
    Exibir.exibirProdutos(listProduct);
    print("ID_Venda: ${idVenda}");
    sales.id = idVenda;
    int? op;
    do{
      print('Informe a quantidade desejada? ');
      sales.quantidade = int.parse(stdin.readLineSync()!);
      print("Informe o id do produto?");
      sales.idproduto = int.parse(stdin.readLineSync()!);
      if(estoque.cannotDoInventory(sales.quantidade, listProduct) == true){
        print('Impossível fazer a venda, quantidade insuficente!');
        print('Gostaria de adicionar outro produto a venda? [ 1 ] SIM');
        op = int.parse(stdin.readLineSync()!);
      }else{
        sales.total = calcFunctions.gerarTotal(sales.idproduto, sales.quantidade, listProduct);
        estoque.inventory(sales.idproduto, sales.quantidade, listProduct);
        listVenda.add(sales);
        salesControl.addProduto_vendas(sales.id!, sales.idproduto!, sales.quantidade!, sales.total!, listSalesAndProduct);
        print('Gostaria de adicionar outro produto a venda? [ 1 ] SIM');
        op = int.parse(stdin.readLineSync()!);
      }
    }while(op == 1);
    Exibir.exibirVendas(listVenda, listSalesAndProduct);
    calcFunctions.totalCompra(listSalesAndProduct);
    idVenda = idVenda + 1;
  }
}