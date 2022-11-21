import 'package:emotion_based_music_player/Models/PlayListsModel.dart';
import 'package:emotion_based_music_player/Pages/SongPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF303151).withOpacity(0.6),
            const Color(0xFF303151).withOpacity(0.9)
          ],
        )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.grid_view_rounded),
          actions: [
            Container(
              margin: const EdgeInsets.only(top:15, right: 20),
              child: const CircleAvatar(
                backgroundImage:NetworkImage(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fcolombo&psig=AOvVaw1STvug0X7w3V7JgSZkvD9X&ust=1666068041681000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJC4x5-55voCFQAAAAAdAAAAABAJ'
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:20, top: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left:20, top: 20, right: 20),
                        child: Text("Hello, Welcome",style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left:20, right: 20),
                        child: Text("What do you want to hear",style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16,
                        ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:20, top: 15, right: 20, bottom: 20),
                        child: Container(
                          height: 50,
                          width: 380,
                          decoration: BoxDecoration(
                            color: const Color(0xFF31314F),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                height: 50,
                                width: 200,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Search the Music",
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 20.0,
                          bottom: 20.0,
                          right: 20.0,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: (){
                                Get.toNamed('/EmotionDetection');
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children:[
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        'assets/Images/sad.jpg',
                                        height: MediaQuery.of(context).size.height*0.45,
                                        width: MediaQuery.of(context).size.height,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width*0.55,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Detect Emotion',
                                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.camera_alt,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Playlists",style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 20),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: playlists.length,
                                itemBuilder: ((context,index){
                                  return InkWell(
                                    onTap: (){
                                      Get.toNamed('/playlist', arguments: playlists[index]);
                                    },
                                    child: Container(
                                      height: 75,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF31314F),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              playlists[index].imageUrl,
                                              height: 50,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  playlists[index].title,
                                                  style: TextStyle(
                                                    color: Colors.white.withOpacity(0.8),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${playlists[index].songs.length} songs',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.white.withOpacity(0.8),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          IconButton(
                                              onPressed: (){},
                                              icon: const Icon(
                                                Icons.play_circle,
                                                color: Colors.white,
                                              ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                })
                            ),
                          ],
                        ),

                      ),


                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
