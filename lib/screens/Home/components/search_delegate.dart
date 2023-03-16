import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/components/api_manager/api_manager.dart';
import 'package:movies_app/modules/api_modules/movies_with_query/MovieWithQuery.dart';
import 'package:movies_app/modules/theme/my_theme.dart';
import 'package:movies_app/screens/Movie/movie_item_modified.dart';

class SearchDelegateImp extends SearchDelegate {  @override
@override
ThemeData appBarTheme(BuildContext context) {
  return ThemeData(
    appBarTheme:  AppBarTheme(
      color: MyTheme.yellow,
      elevation: 0,
    ),
  );
}
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(Icons.search,color: Colors.white,),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {
      Navigator.of(context).pop();
    }, icon: Icon(Icons.clear,color: Colors.white,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return  Container(
      color: MyTheme.mainColor,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Search results for ' ${query} '",style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headline6),),
            ),
          SizedBox(height: 10,),
          Expanded(
            child: FutureBuilder<MovieWithQuery>(
              future: ApiManager.getMoviesWithQuery(query),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.hasError){
                  return Center(
                    child: Text("Error displaying data ${snapshot.error.toString()}",style: const TextStyle(color: Colors.white),),
                  );
                }
                if(snapshot.data?.success==false){
                  return Center(
                    child: Text("Server error ${snapshot.data?.status_message}",style: const TextStyle(color: Colors.white),),
                  );
                }
                var movies=snapshot.data?.results;
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (_, index) {
                    return MovieItemModified(movie: movies?[index]);
                  }, itemCount: movies?.length??0);

              },),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
      color: MyTheme.secondaryColor,
    );
  }
}

