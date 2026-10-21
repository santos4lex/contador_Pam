import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
    );
}

// Atalho para criar Widget Stateless depois do enter
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // Apagando a bandeira de Debug
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// Criando o Widget Stateful
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

 // Função de decrementar
  void decrement(){
    setState((){
      contador--;
    });
    
    print(contador);
  }

  // Função de incrementar
  void increment(){
    setState(() {
      contador++;
    });
    print(contador);
    
  }

  bool get isEmpty => contador == 0;
  bool get isFull => contador == 15;

  @override
  Widget build(BuildContext context) {
  return Scaffold(

    // Conteúdo do Widget
   body: Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/fundo_resenha1.jpg'),
      fit: BoxFit.cover,
      ),
    ),
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        // Caso estiver cheio, mostra "Lotado!". Senão, mostra "Pode entrar!"
        Text(isFull ? 'Lotado!' : 'Pode entrar!',
        style: TextStyle(
          fontSize: 26,
          color: isFull ? Colors.red : Color.fromARGB(255,4,87,154),
          fontWeight: FontWeight.w700
        ),
      ),
      Padding(padding: EdgeInsets.all(40),
       child: Text(
        contador.toString(),
        style: TextStyle(
          fontSize: 100,
          color: Color.fromARGB(255,4,87,154),
          ),
        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: isEmpty ? null : decrement,
            style: TextButton.styleFrom(backgroundColor: isEmpty ?  Colors.blue.withOpacity(0.2) : Colors.blue,
            fixedSize: const Size(100,100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )
            ),

            child: Text("Sair",
              style: TextStyle(
                color: Colors.black,
                fontSize:16,
              ),
            )
            ),

            SizedBox( width: 32,),

            TextButton(onPressed: isFull ? null : increment, 
            style: TextButton.styleFrom(
              backgroundColor: isFull ? Colors.blue.withOpacity(.2) : Colors.blue,
              fixedSize: const Size(100,100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
              )
            ),
            
            child: Text("Entrar",
            style: TextStyle(
              color: Colors.black,
              fontSize:16,
            ),
            ),
            ),
          ],
        ),
      ],
    ),
   ),
  );
  }
}


