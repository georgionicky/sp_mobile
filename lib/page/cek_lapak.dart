import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_mobile/beranda.dart';
import 'package:sp_mobile/model/daftarBlok.dart';

// ignore: camel_case_types
class cek_Lapak extends StatefulWidget {
  const cek_Lapak({super.key});

  @override
  State<cek_Lapak> createState() => _cek_LapakState();
}

// ignore: camel_case_types
class _cek_LapakState extends State<cek_Lapak> {
  // ignore: avoid_init_to_null
  late DaftarBlok? daftarBlok = null;

  bool search = false;
  List list = [];

  final TextEditingController _noblok = TextEditingController();

  getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    var _token = sharedPreferences.getString('token');

    DaftarBlok.connectToAPI(_token!).then((value) {
      daftarBlok = value;
      list.addAll(value?.daftar);
      setState(() {});
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    int? len = daftarBlok?.jmlBlok ?? 0;

    return Scaffold(
      // ignore: unnecessary_new
      appBar: new AppBar(
        title: const Text("Menu Cari Blok",
            style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        // ignore: unnecessary_new
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          // ignore: unnecessary_new
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => const beranda())),
        ),
        backgroundColor: const Color.fromRGBO(39, 174, 96, 100),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 750,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Cari Blok",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Nomor Blok",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      nomorBlok(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Daftar Blok",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GridView.builder(
                    primary: false,
                    itemCount: (search == true) ? list.length : len,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text(
                              (search == true)
                                  ? '${list[index]['kode']}'
                                  : '${daftarBlok?.daftar[index]['kode']}',
                              textAlign: TextAlign.center,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ),
                        color: (search != true)
                            ? (daftarBlok?.daftar[index]['riwayat_retribusi']
                                        .length ==
                                    0)
                                ? Colors.grey
                                : (daftarBlok?.daftar[index]
                                                ['riwayat_retribusi'][0]
                                            ['status_kehadiran'] ==
                                        "1")
                                    ? const Color.fromRGBO(39, 174, 96, 100)
                                    : const Color.fromARGB(156, 255, 2, 2)
                            : (list[index]['riwayat_retribusi'].length == 0)
                                ? Colors.grey
                                : (list[index]['riwayat_retribusi'][0]
                                            ['status_kehadiran'] ==
                                        "1")
                                    ? const Color.fromRGBO(39, 174, 96, 100)
                                    : const Color.fromARGB(156, 255, 2, 2),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 5,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _searchName(String name) {
    if (name.isNotEmpty) {
      setState(() {
        list.clear();
        //melakukan perulangan/looping
        daftarBlok?.daftar.forEach((item) {
          //jika list data ada yang mengandung susunan huruf yang dicari
          //maka masukan ke dalam data list
          if (item['kode'].toLowerCase().contains(name.toLowerCase())) {
            list.add(item);
          }
        });
      });
    } else {
      setState(() {
        list.clear();
        list.addAll(daftarBlok?.daftar);
        search = false;
      });
    }
  }

  Widget nomorBlok() {
    return TextFormField(
        controller: _noblok,
        validator: (String? value) {
          if (value!.isEmpty) return "Nomor Blok Tidak Boleh Kosong";
          return null;
        },
        style: const TextStyle(fontSize: 12.0, height: 0.5),
        onChanged: ((value) {
          if (value.isNotEmpty) {
            search = true;
          } else {
            search = false;
          }
          _searchName(value);
        }),
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromRGBO(39, 174, 96, 100),
              width: 2,
            )),
            prefixIcon: Icon(
              Icons.store_sharp,
              color: Colors.grey,
            ),
            labelText: "Nomor Blok",
            helperText: "Nomor Blok Tidak Boleh Kosong",
            hintText: "Nomor Blok"));
  }
}
