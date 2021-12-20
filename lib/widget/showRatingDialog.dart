import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rating_dialog/rating_dialog.dart';



class ShowRatingDialog extends StatefulWidget {

  @override
  _ShowRatingDialogState createState() => _ShowRatingDialogState();
}

class _ShowRatingDialogState extends State<ShowRatingDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rating dan Komen'),
              backgroundColor: Colors.green),
      body: Container(
          child: Center(
            child: ElevatedButton(
                child: Text( 'Klik disini', style: TextStyle(color: Colors.white, fontSize: 15) ),
                style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 5,
                shape: const BeveledRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: EdgeInsets.all(12)
            ),
            onPressed: showRatingDialog,
          ),

          ),
        ),
    );
  }

  void showRatingDialog() {
    final ratingDialog = RatingDialog(
      starColor: Colors.lightGreen,
      title: Text('Rate this app'),
      message: Text(
          'Jika anda berkenan, Bisakah anda menyisihkan sedikit waktu untuk memberi rating pada aplikasi ini, Terimakasih atas supportnya!'),
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, ');
        print('comment: ${response.comment}');
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ratingDialog,
    );
  }
}