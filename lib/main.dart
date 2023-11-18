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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "SVAR",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 2.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          Destino(
              nome: "Angra dos Reis",
              imagem: "assets/images/angra-dos-reis.jpg",
              valord: 384.0,
              valorp: 70.0),
          Destino(
              nome: "Jericoacoara",
              imagem: "assets/images/jeri.jfif",
              valord: 571.0,
              valorp: 75.0),
          Destino(
              nome: "Arraial do Cabo",
              imagem: "assets/images/arraial.jpg",
              valord: 534.0,
              valorp: 65.0),
          Destino(
              nome: "Florianópolis",
              imagem: "assets/images/flori.jpg",
              valord: 348.0,
              valorp: 85.0),
          Destino(
              nome: "Madri",
              imagem: "assets/images/madri.jpg",
              valord: 401.0,
              valorp: 85.0),
          Destino(
              nome: "Paris",
              imagem: "assets/images/paris.jpg",
              valord: 546.0,
              valorp: 95.0),
          Destino(
              nome: "Orlando",
              imagem: "assets/images/orlando.jpg",
              valord: 616.0,
              valorp: 105.0),
          Destino(
              nome: "Las Vegas",
              imagem: "assets/images/lasvegaas.jpg",
              valord: 504.0,
              valorp: 110.0),
          Destino(
              nome: "Roma",
              imagem: "assets/images/roma.jpg",
              valord: 478.0,
              valorp: 85.0),
          Destino(
              nome: "Chile",
              imagem: "assets/images/chile.jpg",
              valord: 446.0,
              valorp: 95.0),
        ],
      ),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome;
  final String imagem;
  final double valord;
  final double valorp;
  const Destino(
      {required this.nome,
      required this.imagem,
      required this.valord,
      required this.valorp,
      super.key});
  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int _nDiarias = 0;
  int _nPessoas = 0;
  double _valorTotal = 0.0;
  void _setDiarias() {
    setState(() {
      _nDiarias++;
    });
  }

  void _setPessoas() {
    setState(() {
      _nPessoas++;
    });
  }

  void _setValorTotal() {
    setState(() {
      _valorTotal = (_nDiarias * widget.valord) + (_nPessoas * widget.valorp);
    });
  }

  void _limpar() {
    setState(() {
      _nDiarias = 0;
      _nPessoas = 0;
      _valorTotal = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 393,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(widget.imagem),
                  fit: BoxFit.fill,
                ),
              )),
          Text(
            widget.nome,
            style: TextStyle(fontSize: 25, color: Colors.deepPurpleAccent),
          ),
          Text("Diária: R\$ ${widget.valord} <-> Pessoa: R\$ ${widget.valorp}",
              style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 250,
                  child: Text(
                    "Quantidade de dias: ${_nDiarias}",
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  )),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: _setDiarias,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 250,
                  child: Text(
                    "Quantidade de pessoas: ${_nPessoas}",
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  )),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: _setPessoas,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Text("Valor Total -> R\$ ${_valorTotal}",
              style: TextStyle(fontSize: 20, color: Colors.lightBlue)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: _setValorTotal,
                child: Text("Calcular",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: _limpar,
                child: Text("Limpar",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
