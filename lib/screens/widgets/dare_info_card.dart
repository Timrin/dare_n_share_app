import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:flutter/material.dart';

///A dare info card presents information about a dare configuration
/// in a card format. Information such as title and description of
/// the dare are displayed. Color and an image should also be part
/// of the info card. This data should be part of the IDare object.
class DareInfoCard extends StatelessWidget {
  final IDare dare;

  DareInfoCard({@required this.dare});

  ///Build a dare info card
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Text(
                dare.getTitle(),
                //Could insert typeOfdare instead, so that this could be reused
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: RichText(
                  text: TextSpan(text: dare.getDescription(),
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                    ]
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

