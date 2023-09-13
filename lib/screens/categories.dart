
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/models/Category.dart';
import 'package:my_first_flutter_app/widgets/CategoryEdit.dart';
import 'package:my_first_flutter_app/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';
import 'package:my_first_flutter_app/widgets/CategoryAdd.dart';


class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}
class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context){
  final provider = Provider.of<CategoryProvider>(context);
  List<Category> categories = provider.categories;
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body:  ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context,index){
                  Category category = categories[index];
                  return ListTile(
                    title: Text(category.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context){
                                  return CategoryEdit(category,provider.updateCategory);
                                }
                            );
                          },


                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: ()=> showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text('Confirmtion'),
                                content: Text('Are you sure you want to delete?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => deleteCategory(provider.deleteCategory, category),
                                    child: Text('Confirm'),
                                  ),
                                  TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel'))
                                ],
                              );
                            }
                          ),


                        ),
                      ],
                    )
                  );
                },
              ),
        floatingActionButton: new FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context){
                    return CategoryAdd(provider.addCategory);
                  });
            },
        child: Icon(Icons.add),
        ),

    );

  }

  Future deleteCategory(Function callback, Category category) async {
    await callback(category);
    Navigator.pop(context);
  }
}