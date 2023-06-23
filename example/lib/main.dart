import 'package:dg_direct_link/dg_direct_link.dart';
import 'package:dg_direct_link/widgets/dg_direct_link_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'DG direct link (demo)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController controller = TextEditingController();
 String support = "\n- VK"+
"\n- SolidFiles"+
"\n- MediaFire"+
"\n- FEmbed"+
"\n- GoogleDrive"+
"\n- Ok.ru"+
"\n- Dropbox"+
"\n- Vimeo"+
"\n- Facebook"+
"\n- Instagram"+
"\n- Youtube"+
"\n- IMDB"+
"\n- Xnxx"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
       
        child: SingleChildScrollView(
           padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Paste your link'),
                controller: controller),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                 showModalBottomSheet(context: context, builder:(context) {
                   return Container(
                    width: double.infinity,
                      padding: EdgeInsets.all(29),
                     child:  DGDirectLinkWidget(
                  url: controller.text,
                  loading: (){
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  );
                  }, error: (){
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Error'),
                  );
                  }, complete: (links){
                  return  ListTile(title: Text(links[0].quality),
                    subtitle: Text(links[0].link,maxLines: 1,style:TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11)),
                    );
                  } )
                   );
                 },);
                }, child: Text('Get single quality')),
              ),
               SizedBox(height: 20),
        
                 SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  
                  onPressed: (){
                 showModalBottomSheet(
                  
                  context: context, builder:(context) {
                   return Container(
                    width: double.infinity,
                      padding: EdgeInsets.all(29),
                     child:  DGDirectLinkWidget(
                  url: controller.text,
                  loading: (){
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  );
                  }, error: (){
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Error'),
                  );
                  }, complete: (links){
                  return  ListView.separated(
                    shrinkWrap: true,
                    itemCount: links.length,
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemBuilder:(context, index) {
                    return ListTile(
                    
                    title: Text(links[index].quality),
                    subtitle: Text(links[index].link,maxLines: 1,style:TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11)),
                    );
                  },);
                  } )
                   );
                 },);
                }, child: Text('Get Multiple quality')),
              ),
              SizedBox(height: 20,),
               Text('Support links',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
               Text(support)
        
            ],
          ),
        ),
      ),
    );
  }
}
