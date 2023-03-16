import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/components/api_manager/api_manager.dart';
import 'package:movies_app/modules/api_modules/SourceResponse.dart';
import 'package:movies_app/screens/Movie/movie_item.dart';
import 'package:movies_app/screens/Search/search_screen.dart';

import '../../modules/theme/my_theme.dart';
import 'components/search_delegate.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('Nice to see',
                                    style: GoogleFonts.poppins(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(fontWeight: FontWeight.w600))),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('you back',
                                    style: GoogleFonts.poppins(
                                        textStyle:
                                        Theme.of(context).textTheme.headline5))
                              ],
                            ), //------- Hello user Row ------
                            Text('Your movies are waiting',
                                style: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color: MyTheme.gray))),
                          ],
                        ), //------Header text column------
                      ],
                    ) ,//------------- Header row -------------- ,
                    const SizedBox(height: 30,),
                    InkWell(
                      onTap:() {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      } ,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(50),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Search",style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white)),),
                            Icon(Icons.search,size: 30,color: Colors.white)
                          ],),
                      ),
                    ),// -----------search bar ------------------
                    const SizedBox(height: 30,),
                    Text("Filters",style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headline6)),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            //------------ icon and text ----------------------
                            Column(children: [
                              Container(
                                padding: const EdgeInsets.all(17),
                                decoration: BoxDecoration(
                                    color: MyTheme.yellow,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))
                                ),
                                child: Image.asset('assets/genre.png'),
                              ),
                              Text('Genre',style: GoogleFonts.poppins(textStyle: TextStyle(color: MyTheme.gray,fontSize: 14)),)
                            ],)
                          ],
                        ),Column(
                          children: [
                            //------------ icon and text ----------------------
                            Column(children: [
                              Container(
                                padding: const EdgeInsets.all(17),
                                decoration: BoxDecoration(
                                    color: MyTheme.yellow,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))
                                ),
                                child: Image.asset('assets/imdb.png'),
                              ),
                              Text('Top IMDB',style: GoogleFonts.poppins(textStyle: TextStyle(color: MyTheme.gray,fontSize: 14)),)
                            ],)
                          ],
                        ),Column(
                          children: [
                            //------------ icon and text ----------------------
                            Column(children: [
                              Container(
                                padding: const EdgeInsets.all(17),
                                decoration: BoxDecoration(
                                    color: MyTheme.yellow,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))
                                ),
                                child: Image.asset('assets/language.png'),
                              ),
                              Text('Language',style: GoogleFonts.poppins(textStyle: TextStyle(color: MyTheme.gray,fontSize: 14)),)
                            ],)
                          ],
                        ),Column(
                          children: [
                            //------------ icon and text ----------------------
                            Column(children: [
                              Container(
                                padding: const EdgeInsets.all(17),
                                decoration: BoxDecoration(
                                    color: MyTheme.yellow,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))
                                ),
                                child: Image.asset('assets/watched.png'),
                              ),
                              Text('Watched',style: GoogleFonts.poppins(textStyle: TextStyle(color: MyTheme.gray,fontSize: 14)),)
                            ],)
                          ],
                        ),
                      ],
                    ), //-------------------- filter elements row -------------------
                    const SizedBox(height: 20,),
                    Text("Top rated",style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headline5)),
                  ]
              )
          ),
          Expanded(
            child: FutureBuilder<SourceResponse>(
              future: ApiManager.getSources(),
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
                  padding: EdgeInsets.only(left: 20,bottom: 5),
                  separatorBuilder: (context, index) => SizedBox(width: 12,),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return MovieItem(movie: movies?[index]);
                  }, itemCount: movies?.length??0,);

              },),
          )
        ],
      ),
    );
  }
}
