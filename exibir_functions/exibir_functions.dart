import '../produtos/produto.dart';
import '../vendas/venda.dart';
import '../vendas/vendas_produtos.dart';

class Exibir{

  static void exibirProdutos(List<Produto>listProduct){
    for(var i = 0; i < listProduct.length; i++){
      print("ID_Produto: ${listProduct[i].id}\n"
          "Nome_Produto: ${listProduct[i].name}\n"
          "Quantidade: ${listProduct[i].qtd}\n"
          "Valor: ${listProduct[i].valor}\n");
    }
  }
  static void exibirVendas(List<Venda>listVenda, List<Controle>listSalesAndProduct){
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
}