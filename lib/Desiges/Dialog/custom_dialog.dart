import 'package:flutter/material.dart';

class Custom_Dialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: RaisedButton(onPressed: ()=>_setOnClickShowDiaLog(context), child: Text('OnClick'), color: Colors.yellow,)));
  }
  _setOnClickShowDiaLog(BuildContext context){
    showDialog(
      barrierDismissible: false, // user must tap button for close dialog!
      context: context,
      builder: (BuildContext context) => CustomDialog(title: "Success",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        buttonText: "OK",
        image: 'https://ttol.vietnamnetjsc.vn/images/2019/07/17/16/06/diem-thi-cua-hot-girl-hot-boy-1.jpg',
      ),
    );
  }
}
class CustomDialog extends StatelessWidget {
  final String title, description, buttonText, image;
  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),

      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
//            backgroundColor: Colors.blueAccent,
            radius: Consts.avatarRadius,
          ),
        ),

      ],
    );
  }
}
class Consts {
  Consts._();
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}