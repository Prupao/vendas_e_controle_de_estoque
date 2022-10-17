import 'dart:io';
import 'venda.dart';
import 'produto.dart';
import 'vendas_produtos.dart';

int? option;
var listProduct = <Produto>[];
var listVenda = <Venda>[];
var listSalesAndProduct = <Controle>[];

void menu (){
  print('[ 1 ] Cadastrar Produtos \n'
      '[ 2 ] Vendas \n'
      '[ 3 ] Estoque \n'
      '[ 4 ] Encerrar');
  print('Escolha: ');
}

int IdProdutos = 1;
void addProdutos(){
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
  exibirProdutos();
  IdProdutos = IdProdutos + 1;
}

void exibirProdutos(){
  for(var i = 0; i < listProduct.length; i++){
    print("ID_Produto: ${listProduct[i].id}\n"
        "Nome_Produto: ${listProduct[i].name}\n"
        "Quantidade: ${listProduct[i].qtd}\n"
        "Valor: ${listProduct[i].valor}\n");
  }
}

int idVenda = 1;
void Addsale(){
  var sales = Venda();
  exibirProdutos();
  print("ID_Venda: ${idVenda}");
  sales.id = idVenda;
  int? op;
  do{
    print('Informe a quantidade desejada? ');
    sales.quantidade = int.parse(stdin.readLineSync()!);
      print("Informe o id do produto?");
      sales.idproduto = int.parse(stdin.readLineSync()!);
      if(cannotDoInventory(sales.quantidade) == true){
        print('Impossível fazer a venda, quantidade insuficente!');
        print('Gostaria de adicionar outro produto a venda? [ 1 ] SIM');
        op = int.parse(stdin.readLineSync()!);
      }else{
        sales.total = gerarTotal(sales.idproduto, sales.quantidade);
        inventory(sales.idproduto, sales.quantidade);
        listVenda.add(sales);
        addProduto_vendas(sales.id, sales.idproduto!, sales.quantidade, sales.total);
        print('Gostaria de adicionar outro produto a venda? [ 1 ] SIM');
        op = int.parse(stdin.readLineSync()!);
      }
  }while(op == 1);
  exibirVendas();
  totalCompra();
  idVenda = idVenda + 1;
}

void exibirVendas(){
  for(var i = 0; i < listVenda.length; i++){
    if(listSalesAndProduct[i].total != 0){
      print('LISTA VENDA_PRODUTO');
      print("Id_Venda: ${listSalesAndProduct[i].id_vendas}\n"
          "Id_Produto: ${listSalesAndProduct[i].id_produtos}\n"
          "Qtd: ${listSalesAndProduct[i].qtd}\n"
          "Valor: ${listSalesAndProduct[i].total}\n");
    }
  }
}

void addProduto_vendas(venda, int produto, qtd, total){
  var sales_produtos = Controle();
  sales_produtos.id_vendas = venda;
  sales_produtos.id_produtos = produto;
  sales_produtos.qtd = qtd;
  sales_produtos.total = total;
  listSalesAndProduct.add(sales_produtos);
}

void inventory(int? idProduto, int? quantidade){
  int? test;
  for(int i= 0; i < listProduct.length; i++){
    if(quantidade! > listProduct[i].qtd!){
      print('Impossível fazer o controle do estoque do produto ${listProduct[i].qtd!}');
    }else{
      if(listProduct[i].id == idProduto && listProduct[i].qtd != 0){
        test = listProduct[i].qtd! - quantidade;
        if(test < 0){
          print('Essa conta não pode ser feita!');
        }else{
          listProduct[i].qtd = test;
        }
      }
    }
  }
}

bool cannotDoInventory(sales){
  bool? test;
  for(var i = 0; i < listProduct.length; i++){
    if(sales > listProduct[i].qtd){
      test = true;
    }else{
      test = false;
    }
  }
  return test!;
}

double gerarTotal(idProduto, quantidade){
  double? total;
  for(var i = 0; i < listProduct.length; i++){
    if(listProduct[i].id == idProduto){
      if(listProduct[i].qtd! <= 0 && quantidade > listProduct[i].qtd!){
        return total = 0;
      }else{
        total = listProduct[i].valor! * quantidade!;
      }
    }
  }
    return total!;
}

void totalCompra() {
  double? sum = 0;
  for(var i = 0; i < listSalesAndProduct.length; i++){
    sum = sum! + listSalesAndProduct[i].total!;
  }
  print('O valor final foi: ${sum} reais');
}

void main(){
  while(option != 4){
    try{
      menu();
      option = int.parse(stdin.readLineSync()!);
      switch(option){
        case 1:
          addProdutos();
          break;
        case 2:
          Addsale();
          break;
        case 3:
          print('=*' * 12);
          print('---PRODUTOS---');
          exibirProdutos();
          print('=*' * 12);
          print('---VENDAS---');
          exibirVendas();
          print('=*' * 12);
          break;
        default:
          totalCompra();
          print('SAINDO...');
          break;
      }
    }catch(e){
      print('=#' * 10);
      //rethrow;
    }
  }
}