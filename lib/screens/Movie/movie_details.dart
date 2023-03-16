import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/modules/api_modules/Movie.dart';
import 'package:movies_app/modules/api_modules/MovieTrailer.dart';
import 'package:movies_app/modules/api_modules/Trailer.dart';
import 'package:movies_app/modules/theme/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/api_manager/api_manager.dart';

class MovieDetails extends StatefulWidget {
  static const String routeName = 'MovieDetails';

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Movie;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${args?.posterPath}"),
              fit: BoxFit.cover,
              opacity: 0.4)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.title}",
                      style: GoogleFonts.poppins(
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(fontSize: 32, fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text("${args.voteAverage} | ",
                            style: GoogleFonts.poppins(
                                textStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                    fontSize: 25, fontWeight: FontWeight.w500))),
                        Text("${args.releaseDate?.substring(0, 4)}",
                            style: GoogleFonts.poppins(
                                textStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                    fontSize: 25, fontWeight: FontWeight.w500))),

                      ],
                    ),

                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: FutureBuilder<MovieTrailer>(
                  future: ApiManager.getMovieTrailer(args.id),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if(snapshot.hasError){
                      return Center(
                        child: Text("Error displaying data ${snapshot.error.toString()}",style: TextStyle(color: Colors.white),),
                      );
                    }
                    if(snapshot.data!.trailers!.isEmpty){
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("No trailer availabe for this movie",style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
                      );
                    }else {
                      var trailer=snapshot.data?.trailers![0].key;
                      return
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            width: 400,
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[ ElevatedButton(onPressed:() {
                                  urlLauncher("https://www.youtube.com/watch?v=${trailer??""}");
                                } ,child: Icon(Icons.play_arrow,size: 20,color: Colors.black,),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),),]
                              )
                          );
                        }, itemCount: trailer?.length);
                    }

                  },),
              )
            ],
          ),

        ),
      ),
    );
  }

  void urlLauncher(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.platformDefault);
    }
    else throw "can't open url ";
  }
}
