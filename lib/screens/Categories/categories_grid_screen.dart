import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/components/api_manager/api_manager.dart';
import 'package:movies_app/modules/api_modules/Genres/Genre.dart';
import 'package:movies_app/screens/Categories/components/single_genre_grid.dart';

class CategoryGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Genre>(
        future: ApiManager.getGenres(),
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
          return SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Pick a category",style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headline4),),
                SizedBox(height: 10,),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 8 / 7,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      var selectedGenre = snapshot.data?.genres?[index];
                      return SingleGenreGrid(name: selectedGenre?.name, id: selectedGenre?.id);
                    },
                    itemCount: snapshot.data?.genres?.length??0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
