import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import '../bottom_navigator.dart';
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
import 'globals.dart' as globals;

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 35),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Icon(
                        Icons.navigate_before,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        globals.status
                            ? globals.player.play('sound.mp3')
                            : null;
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Container(
                        height: 33,
                        width: 33,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              color: Colors.black,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image(
                            height: 33,
                            width: 33,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/user1.jpg'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nMassa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Faucibus turpis in eu mi bibendum.\n\nNunc mattis enim ut tellus. Ac tincidunt vitae semper quis. Aliquet nec ullamcorper sit amet risus nullam eget felis eget. Sed sed risus pretium quam vulputate dignissim suspendisse in.\n\nLorem ipsum dolor sit amet consectetur adipiscing.\n\nAmet volutpat consequat mauris nunc congue nisi vitae suscipit tellus.proin fermentum leo vel. Fringilla est ullamcorper eget nulla facilisi. Eu feugiat pretium nibh ipsum consequat nisl vel pretium.\n\nNec dui nunc mattis enim ut tellus. Phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Pellentesque pulvinar pellentesque habitant morbi tristique senectus.\n\nEget magna fermentum iaculis eu non diam phasellus. Velit scelerisque in dictum non consectetur. Netus et malesuada.',
<<<<<<< HEAD
                  style: TextStyle(fontSize: 17),
=======
                  style: TextStyle(fontSize: 17,color: Theme.of(context).brightness ==
                                            Brightness.light?Colors.black:Color.fromRGBO(158,158,158,1),),
>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
                ),
              ),
            ],
          ),
        ),
<<<<<<< HEAD
=======
                bottomNavigationBar: BottomNavbar(),

>>>>>>> 5cfd5e8b9c4222842c43888a34e783a1847cdfc2
      ),
    );
  }
}
