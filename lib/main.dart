import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'beranda.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(39, 174, 96, 100),
                Color.fromRGBO(39, 174, 96, 100)
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Lembaga Keuangan Desa Sumowono",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70))),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PhysicalModel(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          shape: BoxShape.circle,
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.grey[600],
                            size: 150.0,
                          ),
                        ),
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                            color: Color.fromRGBO(39, 174, 96, 100),
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Masuk untuk melanjutkan",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        PhysicalModel(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          elevation: 10.0,
                          shadowColor: Colors.black,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "E-mail",
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.grey[600])),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        PhysicalModel(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          elevation: 10.0,
                          shadowColor: Colors.black,
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Kata Sandi",
                                prefixIcon:
                                    Icon(Icons.key, color: Colors.grey[600])),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 250.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(
                                  39, 174, 96, 100), // background
                              onPrimary: Colors.white,
                              elevation: 10.0,

                              // foreground
                            ),
                            onPressed: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new beranda())),
                            child: Text('Masuk'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
