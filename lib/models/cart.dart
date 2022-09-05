import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  //catalog field
  late CatalogModel _catalog;

  //collection of IDs
  final List<int> _itemIds=[];

  CatalogModel get catalog=>_catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }

  //get items in the cart
  List<Item> get items=>_itemIds.map((id) => _catalog.getById(id)).toList();

  //get Total Price
  num get totalprice=>items.fold(0, (total, current)=>total+current.price);

  //remove Item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }

}