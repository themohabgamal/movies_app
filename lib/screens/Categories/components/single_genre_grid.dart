import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/Categories/components/arguments.dart';
import 'package:movies_app/screens/Categories/selected_category_screen.dart';

import '../../../modules/theme/my_theme.dart';

class SingleGenreGrid extends StatelessWidget {
  String? name;
  num? id;
  SingleGenreGrid({required this.name,required this.id});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,SelectedCategoryScreen.routeName,arguments: arguments(name: name, id: id));
      },
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: MyTheme.secondaryColor
        ),
        child: Center(child: Text('${name}',style: GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.headline6),)),
      ),
    );
  }
}
