import '../produtos/produto.dart';
import '../vendas/vendas_produtos.dart';

class Calc{

  double gerarTotal(idProduto, quantidade, List<Produto>listProduct){
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

  void totalCompra(List<Controle>listSalesAndProduct) {
    double? sum = 0;
    for(var i = 0; i < listSalesAndProduct.length; i++){
      sum = sum! + listSalesAndProduct[i].total!;
    }
    print('O valor final foi: ${sum} reais');
  }

}