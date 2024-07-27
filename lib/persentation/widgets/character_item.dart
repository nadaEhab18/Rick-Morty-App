import 'package:flutter/material.dart';
import 'package:rick_and_morty_bloc/constants/my_colors.dart';
import 'package:rick_and_morty_bloc/constants/strings.dart';
import 'package:rick_and_morty_bloc/data/models/charcters.dart';

class CharacterItem extends StatelessWidget {
  final Result character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersDetailsScreen,arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: MyColors.myGery,
              child: character.image.isNotEmpty?
              FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loading.gif', image:character.image,fit: BoxFit.cover,) :
                  Image.asset('assets/images/placeholder.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            color: Colors.black54
            ,
            alignment: Alignment.bottomCenter,
            child: Text('${character.name}',style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,

            ),
            overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),

        ),
      ),
    );
  }
}
