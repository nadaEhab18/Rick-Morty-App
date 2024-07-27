import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_bloc/constants/my_colors.dart';
import 'package:rick_and_morty_bloc/data/models/charcters.dart';

class CharactersDetails_screen extends StatelessWidget {
  final Result character;
  const CharactersDetails_screen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGery,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(color: MyColors.myYellow),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
                text: title,
                style: TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
                text: value,
                style: TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 16,
                )),
          ],
        ));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      thickness: 2,
      color: MyColors.myYellow,
      endIndent: endIndent,
    );
  }

  List<String> extractEpisodeNumbers(List<String> episodeUrls) {
    final episodeNumbers = episodeUrls.map((url) {
      final regex = RegExp(r'/(\d+)$');
      final match = regex.firstMatch(url);
      return match != null ? match.group(1)! : '';
    }).toList();
    return episodeNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGery,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      character.origin.name == 'unknown'
                          ? Container()
                          : characterInfo(
                              'Origin : ',
                              '${character.origin.name}' +
                                  ' / ' +
                                  '${character.origin.url}'),
                      character.origin.name == 'unknown'
                          ? Container()
                          : buildDivider(300),
                      characterInfo('Species : ', '${character.species.name}'),
                      buildDivider(280),
                      characterInfo('Gender : ', '${character.gender.name}'),
                      buildDivider(280),
                      characterInfo('Appeared In : ',
                          '${extractEpisodeNumbers(character.episode).join(', ')}'),
                      buildDivider(250),
                      characterInfo('Status : ', character.status.name),
                      buildDivider(300),
                      characterInfo(
                          'Created : ',
                          "${DateTime.parse(character.created.toString()).year.toString()}" +
                              "-" +
                              "${DateTime.parse(character.created.toString()).month.toString()}" +
                              "-" +
                              "${DateTime.parse(character.created.toString()).day.toString()}"),
                      buildDivider(300),
                      SizedBox(
                        height: 20,
                      ),
                      character.origin.name == 'unknown'
                          ? Container()
                          : Center(
                              child: DefaultTextStyle(
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: MyColors.myWhite,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 7.0,
                                      color: MyColors.myYellow,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    FlickerAnimatedText(character.origin.name +
                                        ' ' +
                                        character.species.name +
                                        ' ' +
                                        character.status.name),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
