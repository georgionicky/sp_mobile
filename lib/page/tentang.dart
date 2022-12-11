import 'package:flutter/material.dart';
import 'package:sp_mobile/beranda.dart';

class tentang extends StatefulWidget {
  const tentang({super.key});

  @override
  State<tentang> createState() => _tentangState();
}

class _tentangState extends State<tentang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:
            Text("Menu Panduan", style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new beranda())),
        ),
        backgroundColor: Color.fromRGBO(39, 174, 96, 100),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(bottom: 80, top: 50),
          child: Card(
            elevation: 10,
            child: Form(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                children: <Widget>[
                  Center(
                    child: Text(
                      "Panduan Aplikasi",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),

                  Text(
                    "Cara Print Struk/Karcis",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Jika Pertama Melakukan Cetak Struk",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "1. Setelah masuk ke tampilan KONFIRMASI baik TABUNG ataupun RETRIBUSI, pastikan BLUETOOTH telah menyala sebelum menekan tombol Cetak",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Setelah BLUETOOTH telah menyala, maka tekan tombol CETAK",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 5),
                  Text(
                    "3. Kemudian akan diarahkan ke tampilan Cetak Retribusi/Tabung",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "4. Jika pertama kali masuk ke tampilan cetak baik retribusi maupun tabung, maka harus memilih nama printer bluetooth yang akan digunakan ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "5. Setelah dipilih maka akan ada centang hijau di sebelah kanan printer, kemudian tekan tombol Sambungkan",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "6. Jika telah tersambung maka akan ada tulisan Berhasil Tersambung dibagian atas",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "7. Selanjutnya pengguna dapat langsung menekan Tombol CETAK KARCIS/STRUK",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "8. Karcis/Struk akan di print di printer yang digunakan",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Jika Sudah Pernah Menggunakan Sebelumnya",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "1. Akan Muncul Kata 'Sudah Tersambung Dengan Print', kemudian pengguna dapat langsung menekan Cetak Karcis/Struk",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Jika ingin memutuskan perangkat yang tersambung, tekan tombol PUTUSKAN",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Kemudian cari perangkat menggunakan tombol berwarna biru di kanan bawah, setelah ditekan maka akan dilakukan pencarian perangkat",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "3. Untuk menyambungkan kembali, pilih perangkat dan tekan tombol SAMBUNGKAN",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 25),
                  Text(
                    "Cara Cek Saldo",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "1. Di menu beranda pilih menu Cek Saldo, kemudian akan diarahkan ke menu cek saldo",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Scan QR code rekening",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "3. Nomor Blok, Nama Pemilik Blok dan Jumlah Tabungan akan langsung terisi sesuai dengan nomor rekening yang di scan",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Cara Cek Lapak",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "1. Di menu beranda pilih menu Lapak, kemudian akan diarahkan ke menu lapak",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Akan langsung ditampilkan semua lapak yang ada",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "3. Pengguna bisa mencari blok menggunakan nomor blok, dan langsung diarahkan ke blok yang dicari",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Cara Retribusi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "1. Di menu beranda pilih menu Retribusi, kemudian pengguna akan langsung diarahkan untuk meng-scan QR Code blok",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Setelah di-scan akan tampil data tentang blok tersebut dan jumlah retribusi",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "3. Pengguna harus mencentang kehadiran pemilik jika pemilik tersebut hadir dan tidak mencentang jika tidak hadir",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "4. Jika hadir, tombol akan menjadi warna hijau dengan tulisan BAYAR, sedangkan jika tidak hadir tombol akan menjadi warna merah dengan tulisan LANJUT",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "5. Tekan tombol dibawah, kemudian akan ditanya kebenaran data",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "6. Jika belum benar, maka tekan tulisan PERIKSA KEMBALI kemudian akan diarahkan ke tampilan sebelumnya",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "7. Jika sudah benar, maka tekan tulisan BENAR kemudian akan diarahkan ke tampilan selanjutnya",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "8. Tampilan selanjutnya adalah tampilan konfirmasi tentang retribusi, kemudian tekan tombol cetak struk untuk mencetak karcis/struk",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 25),

                  Text(
                    "Cara Setor Tabungan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "1. Di menu beranda pilih menu Tabung, kemudian pengguna akan diarahkan ke menu tabung dan diminta memasukkan data mengenai tabungan",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Pengguna dapat meng-scan nomor rekening lewat tombol QR di sebelah kanan Nomor Rekening",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 5),
                  Text(
                    "3. Kemudian akan langsung diarahkan untuk scan QR Code Blok/Rekening",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "4. Data rekening tabungan akan langsung ditampilkan",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "5. Kemudian masukkan nominal uang yang akan ditabung",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "6. Setelah itu tekan tombol TABUNG, dan akan diarahkan untuk mengecek lagi data tersebut apakah sudah benar atau tidak",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "7. Jika sudah benar, maka tekan tulisan BENAR kemudian akan diarahkan ke tampilan selanjutnya",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "8. Tampilan selanjutnya adalah tampilan konfirmasi tentang tabung, kemudian tekan tombol cetak struk untuk mencetak karcis/struk",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 25),

                  //Kalo Nd butuh, hapus jo nih button
                ],
              ),
            ),
          )),
    );
  }
}
