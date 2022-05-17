import 'package:cinema_app/services/seatselection.service.dart';
import 'package:cinema_app/services/ticketordering.service.dart';
import 'package:cinema_app/widgets/bottom_back_button.dart';
import 'package:cinema_app/widgets/bottom_popcorn_button.dart';
import 'package:cinema_app/widgets/bottom_quit_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  Widget? optionalButton;

  BottomBar({this.optionalButton});

  @override
  Widget build(BuildContext context) {
    TicketOrderingService ticketOrderingService =
        Provider.of<TicketOrderingService>(context, listen: false);
    SeatSelectionService seatService =
        Provider.of<SeatSelectionService>(context, listen: false);

    return Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomBackButton(
                isBackButton: true,
                label: 'BACK',
                onTap: () {
                  Navigator.pop(context);
                }),
            BottomPopcornButton(
                isBackButton: true,
                label: 'BACK',
                onTap: () {
                  Navigator.pop(context);
                }),
            Row(
              children: [
                this.optionalButton != null
                    ? this.optionalButton!
                    : SizedBox(width: 0),
                SizedBox(width: 10),
                BottomQuitButton(
                    label: 'QUIT',
                    onTap: () {
                      ticketOrderingService.resetOrder();
                      seatService.resetSeatSelection();
                      Navigator.of(context)
                          .popUntil((route) => route.settings.name == '/home');
                    }),
              ],
            )
          ],
        ));
  }
}
