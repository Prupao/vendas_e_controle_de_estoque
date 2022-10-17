import '../exibir_functions/exibir_functions.dart';
import 'produto.dart';
import 'dart:io';

class AddProdutos{

  int IdProdutos = 1;
  void addProdutos(List<Produto>listProduct){
    var produto = Produto();
    print("ID_Produto: ${IdProdutos}");
    produto.id = IdProdutos;
    print('Informe o nome: ');
    produto.name = stdin.readLineSync()!.toUpperCase();
    print('Informe a quantidade? ');
    produto.qtd = int.parse(stdin.readLineSync()!);
    print('Informe o valor: ');
    produto.valor = double.parse(stdin.readLineSync()!);
    listProduct.add(produto);
    Exibir.exibirProdutos(listProduct);
    IdProdutos = IdProdutos + 1;
  }

}