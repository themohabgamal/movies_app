import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/Movie/movie_details.dart';

import '../../modules/api_modules/Movie.dart';


class MovieItem extends StatelessWidget {
  Movie? movie;
  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return
       Container(
        width: 200,
        height: 350,
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                    Navigator.of(context).pushNamed(MovieDetails.routeName ,arguments: movie);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/w500${movie?.posterPath}" ,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
