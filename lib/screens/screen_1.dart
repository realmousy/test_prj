import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/constant/dimensions.dart';
import 'package:test_prj/constant/theme.dart';
import 'package:test_prj/constant/theme/colors.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  ScrollController dialogScrollController;

  @override
  void initState() {
    dialogScrollController = ScrollController(initialScrollOffset: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey,
        child: Dialog(
          insetPadding: ProjectDimensions.containerPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Title", style: theme.textTheme.headline6),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: ProjectColor.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ]),
              Padding(
                padding: ProjectDimensions.containerPadding,
                child: Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis convallis justo non nisi placerat maximus.""",
                  style: theme.textTheme.subtitle1,
                ),
              ),
              Container(
                child: CupertinoScrollbar(
                  radius: ProjectDimensions.scrollBarRadius,
                  isAlwaysShown: true,
                  controller: dialogScrollController,
                  child: Container(
                    color: const Color(0xffDFDEDE), // Custom Color
                    constraints: const BoxConstraints(maxHeight: 400),
                    child: SingleChildScrollView(
                      controller: dialogScrollController,
                      child: Padding(
                        padding: ProjectDimensions.containerPadding,
                        child: Text(
                          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis convallis justo non nisi placerat maximus. Praesent tincidunt ut dui fermentum aliquam. Donec nec sodales mi. Proin ultrices dignissim ullamcorper. Nam eu consectetur nunc. Vivamus facilisis fermentum varius. Integer rutrum, ligula ac tempus maximus, erat justo molestie mauris, tempor porta tellus elit egestas ante. Proin ac leo quis felis posuere dapibus id et felis. Aenean id mattis nulla. Sed at nibh et tortor tempor malesuada. Quisque egestas urna tellus, in tristique risus ultricies laoreet. Donec fringilla, est non dapibus tempor, nulla metus lacinia arcu, at mattis ex dui nec massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras consequat id purus consectetur malesuada. Vestibulum eu varius orci. Nunc ornare neque sit amet volutpat tempus. Aenean et magna nisl. Integer ornare nulla eget odio rutrum tincidunt. Proin imperdiet in sapien id euismod. Sed interdum enim non euismod pulvinar. Quisque imperdiet eros lectus, vel tempus nibh tristique eu. Pellentesque nisi ex, fringilla varius nibh et, porta mollis sapien. Donec quis pulvinar nulla. In tempor a massa et venenatis. Pellentesque scelerisque tempus tellus at venenatis. Aliquam sed nunc vel purus ultrices porttitor pharetra fringilla arcu. Vestibulum ut dui id quam feugiat viverra at ut dui. Ut placerat consequat iaculis. Fusce at urna quis libero vulputate sollicitudin et maximus est. Pellentesque in massa id enim laoreet vehicula nec eu velit. Aliquam vestibulum dolor eu felis feugiat bibendum. Praesent maximus rhoncus elit in finibus. Interdum et malesuada fames ac ante ipsum primis in faucibus.""",
                          style: theme.textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: ProjectDimensions.containerPadding,
                child: FlatButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: ProjectDimensions.buttonBorderRadius),
                  onPressed: () {},
                  child: Text(
                    "TEST BUTTON",
                    style: theme.textTheme.button,
                  ),
                  color: ProjectColor.buttonColor,
                ),
              )
            ],
          ),
        ),
      );
}
