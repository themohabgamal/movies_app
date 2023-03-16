import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/modules/theme/my_theme.dart';
import 'package:movies_app/screens/Movie/movie_details.dart';

import '../../modules/api_modules/Movie.dart';

class MovieItemModified extends StatelessWidget {
  Movie? movie;
  MovieItemModified({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 200,
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500${movie?.posterPath}"),
                fit: BoxFit.cover,
                opacity: 80)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: MyTheme.yellow),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Text("${movie?.voteAverage} ",
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.white, fontSize: 12),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(MovieDetails.routeName, arguments: movie);
                },
              ),
            ),
            Text(
              "${movie?.title}",
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Row(
              children: [
                Text("out at ${movie?.releaseDate}",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.grey, fontSize: 16),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
