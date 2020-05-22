import 'package:dare_n_share_app/dare_configurations/i_dare.dart';
import 'package:flutter/material.dart';

///A dare info card presents information about a dare configuration
/// in a card format. Information such as title and description of
/// the dare are displayed. Color and an image should also be part
/// of the info card. This data should be part of the IDare object.
class DareInfoCard extends StatelessWidget {
  final IDare dareConfig;

  DareInfoCard({@required this.dareConfig});

  ///Build a dare info card
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              title: Text(
                dareConfig.getTitle(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: RichText(
                  text: TextSpan(text: dareConfig.getDescription(),
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

