import 'package:flutter/material.dart';

void main() => runApp(UiFlutter());

class UiFlutter extends StatelessWidget {
  @override 
  Widget build (BuildContext context){

//AREA DO TITULO    
    Widget areaTitulo = Container(
      padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Expanded(
              // #1
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // #2
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Marco Néspoli",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                  Text("Av. Paulista, 1234, Bela Vista, São Paulo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // #3
           WidgetFavoritar(),
          ],
        ),
    );
// FIM DA AREA DO TITULO

// AREA DOS BOTOES
Color color = Color(0xFF4682B4);// Theme.of(context).primaryColor;

Widget areaBotao = Container(
  margin: EdgeInsets.only(top: 10.0),
  decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
          BorderRadius.circular(20.0),
  ),
  padding: EdgeInsets.all(15.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildColunaBotao (color, Icons.call, "Ligar"),
      _buildColunaBotao (color, Icons.near_me, "Rota"),
      _buildColunaBotao (color, Icons.share, "Compartilhar"),
    ],
  ),
);
// FIM DA AREA DOS BOTOES

// AREA DE TEXTO DESCRITIVO 

    Widget areaTextoDescritivo = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(20.0)),
      ),
      padding: const EdgeInsets.all(30),
      child: Text(
          "Treinos personalizados para Condicionamento físico, Emagrecimento, Funcional, HiiT," 
          " Hipertrofia, entre outros."
          " Ideal para quem busca resultados a curto prazo, com motivação e orientação individual,"
          " aulas dinâmicas com foco nos resultados. Treinos prescritos sempre respeitando o condicionamento"
          " e o objetivo do aluno."
          " Entre em contato e receba um orçamento personalizado!",
          style: TextStyle(
            letterSpacing: 1.0,
            wordSpacing: 2.2,
          ),
        
        softWrap: true,
      ),
    );

// FIM DA AREA DE TEXTO DESCRITIVO


  return MaterialApp(
    title: "Ui Flutter",
    home: Scaffold(backgroundColor: Color(0xFF5F9EA0) ,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF5F9EA0),
        title: Text("UI Flutter"),
      ),
    body: Container(margin: EdgeInsets.only(top: 5.0),
      child: ListView(padding: EdgeInsets.all(5.0),
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
              child:  Image.network(
                "https://image.shutterstock.com/image-photo/fit-woman-talking-her-trainer-600w-330260423.jpg",
                height: 240,
                width: 600,
                fit: BoxFit.cover
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: areaTitulo,
            ),
          ],
        ),
        areaTextoDescritivo,
        areaBotao,
      ],
    ) 
    ),
    )
  );
  }
}

Column _buildColunaBotao (Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

// WIDGET PARA FAVORITAR
class WidgetFavoritar extends StatefulWidget {
  @override
  _WidgetFavoritarState createState() => _WidgetFavoritarState();
}
// #enddocregion WidgetFavoritar

// #docregion _WidgetFavoritarState, _WidgetFavoritarState-fields, _WidgetFavoritarState-build
class _WidgetFavoritarState extends State<WidgetFavoritar> {
  // #enddocregion _WidgetFavoritarState-build
  bool _isFavorited = true;
  int _favoriteCount = 41;
  // #enddocregion _WidgetFavoritartState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  // #enddocregion _toggleFavorite

  // #docregion _WidgetFavoritartState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.white,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount', 
              style: TextStyle(
                color: Colors.white,
                //fontSize: 14.0,
                fontWeight: FontWeight.bold,),
            ),
          ),
        ),
      ],
    );
  }
  // #docregion _WidgetfavoritarState-fields
}