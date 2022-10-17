import '../produtos/produto.dart';

class Control{
  void inventory(int? idProduto, int? quantidade, List<Produto>listProduct){
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

  bool cannotDoInventory(sales, List<Produto>listProduct){
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

}