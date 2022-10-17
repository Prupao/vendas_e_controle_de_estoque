import '../vendas_produtos.dart';

class ControleDeVendas{

  void addProduto_vendas(int venda, int produto, int qtd, double total, List<Controle>listSalesAndProduct){
    var sales_produtos = Controle();
    sales_produtos.id_vendas = venda;
    sales_produtos.id_produtos = produto;
    sales_produtos.qtd = qtd;
    sales_produtos.total = total;
    listSalesAndProduct.add(sales_produtos);
  }

}