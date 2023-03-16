import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/modules/theme/my_theme.dart';

import '../Home/components/search_delegate.dart';

class SearchScreen extends StatelessWidget {
static const String routeName="SearchScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: InkWell(
                      onTap:() {
                        showSearch(context: context, delegate: SearchDelegateImp());
                      } ,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 320,
                        height: 50,
                        decoration: BoxDecoration(
                            color: MyTheme.gray.withAlpha(30),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Search",style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white.withAlpha(50))),),
                            Icon(Icons.search,size: 30,color: Colors.white.withAlpha(50))
                          ],),
                      ),
                    ),// -----------search bar ------------------,
                  ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: MyTheme.yellow.withAlpha(50),
                      borderRadius: const BorderRadius.all(Radius.circular(8))
                  ),
                  child: Image.asset('assets/genre.png'),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
