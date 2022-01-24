import 'package:flutter/material.dart';
import 'package:voice_auth_app/data/ev.dart';
import 'package:voice_auth_app/utils/recorder.dart';
import 'package:voice_auth_app/views/notes.dart';
import 'package:voice_auth_app/views/templates/music_animation.dart';
// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const RegisrationView(),
//       ),
//     );
//   }
// }

class RegisrationView extends StatefulWidget {
  const RegisrationView({Key? key}) : super(key: key);

  @override
  State<RegisrationView> createState() => _RegisrationViewState();
}

class _RegisrationViewState extends State<RegisrationView> {
  final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();
  
  String uname = "";
  String error = "";
  bool isRecording = false;
  Recorder recorder = Recorder();

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: PageView(
            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
            /// Use [Axis.vertical] to scroll vertically.
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              register1(pageController),
              register2(pageController),
            ],
          ),
        ),
      ),
    );
  }

  Widget register1(PageController pageController){
    return Stack(
      children: <Widget>[
        backgroundImage(),
        userNameForm(pageController),
      ],
    );
  }

  Widget register2(PageController pageController){
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            SizedBox(
              height: 100,
              child: Visibility(
                visible: isRecording,
                child: MusicVisualizer()
              )
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "Test passage to be read by the user to setup the user model",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffffffff)
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: elevatedButtonColor,
                      minimumSize: const Size(40, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                    ),
                    
                    onPressed: (){
                      pageController.animateToPage(0, duration: const Duration( milliseconds: 250), curve: Curves.easeInOutCubic,);
                    }, 
                    child: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    )
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: elevatedButtonColor,
                      minimumSize: const Size(40, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                    ),
                    
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotesView()),
                      );
                    }, 
                    child: const Icon(
                      Icons.arrow_right_alt_sharp,
                      size: 25,
                    )
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: elevatedButtonColor,
                  minimumSize: const Size(double.infinity, 45)
                ),
                onPressed: () async{
                  if (!isRecording){
                    await recorder.init("test.wav");
                    await recorder.startRecord();
                  }else{
                    await recorder.stopRecord();
                  }
                  setState(() {
                    isRecording = !isRecording;
                  });
                }, 
                child:  Text(isRecording ?'Stop speaking' :  'Start speaking')
              )
            ],
          ),
        )
      ],
    );
  }

  Widget userNameForm(PageController pageController){
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              initialValue: uname,
              decoration: inputDecoration.copyWith(labelText: 'User Name'),
              validator: (val) => (val == null || val.isEmpty) ? 'Please enter User Name' : null,
              onChanged: (val) {
                setState(() {
                  uname = val;
                });
              },
            ),
            const SizedBox(height: 5),
            Text(error, style: const TextStyle(color: Colors.red),),
            const SizedBox(height: 40,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: elevatedButtonColor,
                minimumSize: const Size(double.infinity, 45)
              ),
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  FocusScope.of(context).requestFocus(FocusNode());
                  pageController.animateToPage(1, duration: const Duration( milliseconds: 250), curve: Curves.easeInOutCubic,);
                }
              }, 
              child: const Text('Next')
            ),
          ],
        ),
      )
    );
  }
  Widget backgroundImage(){
    return Column(
      children: <Widget> [
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/auth1.png',
              height: 200,
              // scale: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}


Widget backgroundImage(){
  return Column(
    children: <Widget> [
      const SizedBox(height: 30,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/images/auth1.png',
            height: 200,
            // scale: 0.5,
          ),
        ],
      ),
    ],
  );
}

