import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/components/api_manager/api_manager.dart';
import 'package:movies_app/modules/api_modules/selected_genre/SelectedGenre.dart';
import 'package:movies_app/screens/Categories/components/arguments.dart';
import 'package:movies_app/screens/Categories/components/single_genre_grid.dart';
import 'package:movies_app/screens/Movie/movie_item.dart';
import 'package:movies_app/screens/Movie/movie_item_modified.dart';

class SelectedCategoryScreen extends StatelessWidget {
  static const String routeName = "Selected";
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${args.name}",
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline4),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<SelectedGenre>(
                    future: ApiManager.getSelectedGenreWithId(args.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error displaying data ${snapshot.error.toString()}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      if (snapshot.data?.success == false) {
                        return Center(
                          child: Text(
                            "Server error ${snapshot.data?.status_message}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      var results=snapshot.data?.results;
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.vertical,
                          itemCount: results?.length??0,
                          separatorBuilder: (context, index) => SizedBox(height: 15,),
                          itemBuilder: (context, index) {
                            return new MovieItemModified(movie: results?[index]);
                          },
                          );
                    }),
              ),
            ],
          ),
        ));
  }
}
