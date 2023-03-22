
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Model/CategorySectionModel.dart';
import 'categoryAnimal.dart';
import 'categoryAnime.dart';
import 'categoryArt.dart';
import 'categoryCar.dart';
import 'categoryGame.dart';




class categorySection extends StatefulWidget {
  const categorySection({Key? key}) : super(key: key);

  @override
  State<categorySection> createState() => _categorySectionState();
}

class _categorySectionState extends State<categorySection> {
  late Future<List<CategoryModel>> categoryFuture;

    @override

    void initState() {
    // TODO: implement initState
    super.initState();

    categoryFuture = SendRequestCategory();
  }




  Widget build(BuildContext context) {
    InkWell generateCategory(CategoryModel categoryModel){
      return
        InkWell(
          onTap: (){
            if(categoryModel.id == 1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryAnime()));
            }else if(categoryModel.id == 2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryGame()));
            }else if(categoryModel.id == 3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryCar()));
            }else if(categoryModel.id == 4){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryAnimal()));
            }else if(categoryModel.id == 5){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryArt()));
            }






          },
          child: Card(

            color: Colors.white,
            elevation: 10,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:
                Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(categoryModel.imgurl , fit: BoxFit.cover,),

                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black45
                      ),
                    ),


                    Center(child: Text(
                      categoryModel.description,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                      ),
                    )
                    ),

                  ],
                ),


              ),
            ),
          ),
        );
    }




    return  Scaffold(
      body:
         Container(

          child: FutureBuilder<List<CategoryModel>>(
            future: categoryFuture,
            builder: (context , snapshot){
              if(snapshot.hasData){
                List<CategoryModel>? model = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: model!.length,
                      itemBuilder: (context , index){
                      return  generateCategory(model[index]);
                      },
                  ),
                );

              }else{
                return Center(
                  child: SpinKitSquareCircle(
                    color: Colors.yellow,
                    size: 50,
                  ),
                );;
              }
            } ,

          ),
        ),

    );
  }
}





Future<List<CategoryModel>> SendRequestCategory() async {

  List<CategoryModel> model = [];
  var respons = await Dio().get('https://my-json-server.typicode.com/aminbdev/WallpaperCategory/db');

  for(var Item in respons.data["photos"]){
   model.add(CategoryModel(Item['id'],Item['imgurl'], Item['description']));
  }
  return model;
}