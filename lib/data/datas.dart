// tipe data list CardItemData

class DataPlace {
  final int id;
  final String image;
  final String title;
  final String location;
  final String description;
  final String urlmap;
  final int jumlah;

  DataPlace(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.location,
      required this.urlmap,
      required this.jumlah});
}

final List<DataPlace> dataForCard = [
  DataPlace(
    id: 1,
    title: "Taman Kota GBK 1",
    location: "Senayan, Jakarta Pusat",
    description:
        "Taman Kota GBK (Gelora Bung Karno) merupakan sebuah hutan kota yang terletak di Jakarta, Indonesia. Taman ini berlokasi di sekitar kompleks GBK, yang merupakan salah satu ikon olahraga dan rekreasi di kota tersebut. Dengan luas sekitar 57 hektar, Taman Kota GBK menawarkan lingkungan yang hijau dan menyegarkan bagi pengunjungnya.",
    image:
        'https://wisatamilenial.com/wp-content/uploads/2021/11/Hutan-Kota-Gelora-Bung-Karno-Image-From-@david_hidayat.jpg',
    urlmap: 'https://goo.gl/maps/sXtenSWGbMpjKe59A',
    jumlah: 5000,
  ),
  DataPlace(
    id: 2,
    title: "TIJA Ancol",
    location: "Kec. Pademangan, Jakarta Utara",
    description:
        "Taman rekreasi tematik terbesar dan terlengkap di Jakarta. Terletak di Jakarta Utara berhadapan dengan Laut Jawa, Taman Impian Jaya Ancol merupakan kawasan resor tepi pantai yang berdiri di atas lahan seluas 80 hektar.",
    image:
        'https://www.pesisir.net/wp-content/uploads/2020/07/Pantai-Ancols.jpg',
    urlmap: 'https://goo.gl/maps/hSvdnGDCTqqXYW2x6',
    jumlah: 10359661,
  ),
  DataPlace(
    id: 3,
    title: "Taman Mini Indonesia Indah",
    location: "Kec.Cipayung, Jakarta Timur",
    description:
        "Taman yang merangkum kebudayaan bangsa Indonesia, yang mencakup berbagai aspek kehidupan sehari-hari masyarakat 33 provinsi Indonesia (pada tahun 1975) yang ditampilkan dalam anjungan daerah berarsitektur tradisional, serta menampilkan aneka busana, tarian dan tradisi daerah.",
    image:
        'http://www.indonesia-tourism.com/jakarta/images/taman_mini_indonesia_indah.jpg',
    urlmap: 'https://goo.gl/maps/pPc5zsqyg6rseiecA',
    jumlah: 5064814,
  ),
  DataPlace(
    id: 4,
    title: "T. Marga Satwa Ragunan",
    location: "Ragunan ,Ps. Minggu, Jakarta Selatan",
    description:
        "Sebuah taman image_1_aboutseluas 147 hektar dan berpenghuni lebih dari 2.009 ekor satwa serta ditumbuhi lebih dari 20.000 pohon membuat suasana lingkungannya sejuk dan nyaman. Lahannnya tertata dan terbangun serta sebagian lagi masih dikembangkan menuju suatu kebun binatang yang modern sebagai identitas kota Jakarta.",
    image: 'https://aktualitas.id/wp-content/uploads/2020/05/Ragunan-4.jpg',
    urlmap: 'https://goo.gl/maps/bwYwxaWdZK8TDV4b7',
    jumlah: 5401977,
  ),
  DataPlace(
    id: 5,
    title: "Museum Nasional",
    location: "Kec. Gambir, Jakarta Pusat",
    description:
        "Museum Nasional Indonesia, atau yang sering disebut dengan Museum Gajah, adalah sebuah museum arkeologi, sejarah, etnografi, dan geografi yang terletak di Jakarta Pusat dan persisnya di Jalan Merdeka Barat 12. Museum ini merupakan museum pertama dan terbesar di Asia Tenggara.",
    image:
        'http://1.bp.blogspot.com/-O4dQmY-9838/VaovIMLdtbI/AAAAAAAAKw8/PjlCdaFxK0w/s1600/museum%2Bnasional.JPG',
    urlmap: 'https://goo.gl/maps/bwYwxaWdZK8TDV4b7',
    jumlah: 12071201,
  ),
  DataPlace(
    id: 6,
    title: "Museum Satria Mandala",
    location: "Kuningan Bar ,Jakarta Selatan",
    description:
        "Museum Satria Mandala merupakan museum edukasi sejarah mengenai Tentara Nasional Indonesia (TNI). Museum Satria Mandala menyimpan sejarah tentang perjuangan TNI dari 1945 sampai sekarang.",
    image:
        'https://media-cdn.tripadvisor.com/media/photo-s/0c/15/1e/4f/satria-mandala-museum.jpg',
    urlmap: 'https://goo.gl/maps/zfHSygiyT4GjJFUc8',
    jumlah: 16350,
  ),
  DataPlace(
    id: 7,
    title: "Museum Sejarah Jakarta",
    location: "Pinangsia, Kec. Taman Sari, Jakarta Barat",
    description:
        "Museum Sejarah Jakarta yang terletak di Jalan Taman Fatahillah No.1, Jakarta Barat, adalah sebuah lembaga museum yang memiliki sejarah yang cukup panjang. Pada tahun 1919, dalam rangka 300 tahun berdirinya kota Batavia, warga kota Batavia khususnya Belanda mulai tertarik dengan sejarah kota Batavia.",
    image:
        'http://ciungtips.com/wp-content/uploads/2017/02/jelajahsejarah-Sejarah-Museum-Fatahillah.jpg',
    urlmap: 'https://goo.gl/maps/W6egjqcpZ1pBfbgx9',
    jumlah: 716556,
  ),
  DataPlace(
    id: 8,
    title: "Museum Tekstil",
    location: "Kota Bambu Sel., Kec. Palmerah, Jakarta Barat",
    description:
        "Museum yang memamerkan koleksi aneka kain dari berbagai penjuru Indonesia. Kain-kain tersebut bisa dibilang adalah gambaran tentang betapa kayanya budaya tekstil Indonesia. Selain koleksi kain, Museum Tekstil juga punya koleksi alat-alat untuk membuat kain.",
    image:
        'https://1.bp.blogspot.com/-8zbI2nhZiN0/XmJuHJm-rgI/AAAAAAABJOs/WC2PzZ2cU8cyVssDKWjuCBi5er2mNYJFACLcBGAsYHQ/s1600/IMG-20200305-WA0070.jpg',
    urlmap: 'https://goo.gl/maps/MV9jPbhjj1DQgG2x9',
    jumlah: 34299,
  ),
  DataPlace(
    id: 9,
    title: "Museum Bahari",
    location: "Penjaringan, Kec. Penjaringan, Jakarta Utara",
    description:
        "Museum yang menyimpan koleksi yang berhubungan dengan kebaharian dan kenelayanan bangsa Indonesia dari Sabang hingga Merauke. Museum ini berada di bawah pengawasan dari Dinas Kebudayaan Permuseuman Provinsi Daerah Khusus Ibukota Jakarta.",
    image:
        'https://blog.reservasi.com/wp-content/uploads/2018/01/museum-bahari.jpg',
    urlmap: 'https://goo.gl/maps/iuiWX7wKSJostfBV6',
    jumlah: 27501,
  ),
  DataPlace(
    id: 10,
    title: "M. Seni Rupa dan Keramik",
    location: "Pinangsia, Kec. Taman Sari, Jakarta Barat",
    description:
        "Museum Keramik Kota Tua dibangun untuk menjadi pusat pelestarian seni Indonesia. Bagi Anak Nusantara maupun turis yang ingin berwisata seni dan budaya tentu bisa berkunjung ke museum keramik Kota Tua.",
    image:
        'http://4.bp.blogspot.com/--ylYB9YAsdw/WIrIMm2V6yI/AAAAAAAABiA/kM0-133t0RgAlnpu3r5JTsCslKd5JJvmACK4B/s1600/030204.%2BCeramic%2BMuseum%2BExterior.jpg',
    urlmap: 'https://goo.gl/maps/DiXE2SUFekeHo5ty5',
    jumlah: 184485,
  ),
  DataPlace(
    id: 11,
    title: "Museum Wayang",
    location: "Kota Tua, Kec. Taman Sari, Jakarta Barat",
    description:
        "Museum Wayang merupakan salah satu museum yang paling populer di Jakarta. Letaknya berada di kawasan Kota Tua Jakarta. Segala sesuatu tentang wayang, mulai dari histori, jenis hingga edukasinya ada di sini. Museum ini berlokasi di Jalan Pintu Besar Utara Nomor 27, Pinangsia, Kota Tua, Jakarta Barat.",
    image:
        'https://museum.co.id/wp-content/uploads/2020/09/museum-wayang-jakarta_barat.jpg',
    urlmap: 'https://goo.gl/maps/c14QA7RimKBAeBAz8',
    jumlah: 312081,
  ),
  DataPlace(
    id: 12,
    title: "Museum Joang '45",
    location: "Kb. Sirih, Kec. Menteng, Jakarta Pusat",
    description:
        "Gedung Joang '45 atau Museum Joang 45 adalah salah satu museum yang berada di Jakarta. Saat ini pengelolaannya dilaksanakan oleh Dinas Pariwisata dan Kebudayaan Provinsi DKI Jakarta. Museum ini terletak di Jalan Menteng Raya 31, Kelurahan Kebon Sirih, Kecamatan Menteng, Jakarta Pusat.",
    image:
        'https://cdn.medcom.id/dynamic/content/2020/08/13/1175342/6EZDGhKnMo.jpeg?w=1024',
    urlmap: 'https://goo.gl/maps/ndx77h7gM3vXUZ2T7',
    jumlah: 18545,
  ),
  DataPlace(
    id: 13,
    title: "Taman Arkeologi P.Onrust",
    location:
        "Pulau Untung Jawa, Kec. Kepulauan Seribu Sel., Kab. Administrasi Kepulauan Seribu",
    description:
        "Museum Arkeologi Onrust adalah salah satu kawasan cagar budaya yang juga menjadi destinasi wisata bahari. Museum Arkeologi Onrust berfungsi sebagai sarana informasi dan publikasi sejarah peninggalan arkeologi di Pulau Onrust, Pulau Cipir, Pulau Kelor dan Pulau Bidadari.",
    image:
        'https://kataomed.com/wp-content/uploads/2019/06/Taman-Arkeolog-Onrust-di-Pulau-Onrust.jpg',
    urlmap: 'https://goo.gl/maps/7QQo61cYLmeMyfyt7',
    jumlah: 49234,
  ),
  DataPlace(
    id: 14,
    title: "Pel. Sunda Kelapa",
    location: "Jakarta Utara ,Daerah Khusus Ibukota Jakarta",
    description:
        "Pelabuhan Sunda Kelapa merupakan persinggahan pelayaran antarbangsa yang dibangun tahun 1527 semasa pemerintahan Portugis. Pelabuhan ini disinggahi kapal-kapal antarpulau dan pelayaran rakyat dengan komoditas utama kayu, bahan kebutuhan pokok, barang kelontong, dan bahan bangunan.",
    image:
        'https://thumbs.dreamstime.com/b/jarkata-indonesia-sunda-kelapa-port-fishing-ships-96323440.jpg',
    urlmap: 'https://goo.gl/maps/3ZzeQ2DQ7EJ9Crxw9',
    jumlah: 31879,
  ),
  DataPlace(
    id: 15,
    title: "Kepulauan Seribu",
    location: "Jakarta Utara ,Daerah Khusus Ibukota Jakarta",
    description:
        "Kepulauan Seribu merupakan salah satu wilayah yang masuk ke dalam administrasi Pemerintah Provinsi DKI Jakarta. Secara geografis, Kepulauan Seribu memiliki total wilayah seluas 4.745,62 km2 yang terdiri dari 8,76 km2 daratan, dan terdiri lebih dari 110 pulau.",
    image:
        'https://www.holidify.com/images/cmsuploads/compressed/1024px-Kepulauan_Seribu_20190416235456.jpg',
    urlmap: 'https://goo.gl/maps/oiQcSMJeyu1mNP9V9',
    jumlah: 597526,
  ),
  DataPlace(
    id: 16,
    title: "PBB Setu Babakan",
    location: "Srengseng Sawah, Kec. Jagakarsa, Jakarta Selatan",
    description:
        "PBB Setu Babakan merupakan kawasan yang memiliki potensi wisata sehingga dikembangkan menjadi lokasi wisata dengan berbagai atraksi. Suasana lingkungan PBB Setu Babakan Asri dengan danau dan pohon-pohon peneduh.",
    image:
        'https://asset.kompas.com/crop/74x0:918x563/750x500/data/photo/2018/03/22/404286341.jpg',
    urlmap: 'https://goo.gl/maps/rQD3NrVadGfRc5Z1A',
    jumlah: 471910,
  ),
  DataPlace(
    id: 17,
    title: "Museum Prasasti",
    location: "Petojo Sel., Kecamatan Gambir, Jakarta Pusat",
    description:
        "Museum Taman Prasasti adalah sebuah museum cagar budaya peninggalan masa kolonial Belanda yang berada di Jalan Tanah Abang No. 1, Jakarta Pusat. Museum ini memiliki koleksi prasasti nisan kuno serta miniatur makam khas dari 27 provinsi di Indonesia, beserta koleksi kereta jenazah antik.",
    image:
        'https://4.bp.blogspot.com/-JIzwGxcnEMw/V8WUx3tx37I/AAAAAAAAKYo/N6YMtOBnkOMFxQfdIGGG4vS8pI182glfwCLcB/s1600/museum-prasasti1.jpg',
    urlmap: 'https://goo.gl/maps/RCYn3JN4ShjukpNf7',
    jumlah: 10178,
  ),
  DataPlace(
    id: 18,
    title: "Monumen Nasional",
    location: "Gambir, Kecamatan Gambir, Kota Jakarta Pusat",
    description:
        "Monas resmi dibangun pada 17 Agustus 1961 dan mulai dibuka untuk umum pada tanggal 12 Juli 1975. Monumen Nasional atau yang populer disebut Monas merupakan monumen peringatan yang memiliki tinggi 132 meter atau sekitar 433 kaki dan dibangun diarea seluas 80 Hektar.",
    image:
        'https://3.bp.blogspot.com/-9XAsXL1AfB4/V0UNnlKK1RI/AAAAAAAAHQ0/h9yvTJwZYeE5lT9FfcEt7KI68miuC0HyQCLcB/s1600/monas-3.jpg',
    urlmap: 'https://goo.gl/maps/xQdW2YxLv4RYD88w5',
    jumlah: 12071201,
  ),
  DataPlace(
    id: 19,
    title: "Planetarium",
    location: "Cikini, Kec. Menteng, Kota Jakarta Pusat",
    description:
        "Planetarium adalah gedung teater untuk memperagakan simulasi susunan bintang dan benda-benda langit. Atap gedung biasanya berbentuk kubah setengah lingkaran. Di planetarium, penonton bisa belajar mengenai pergerakan benda-benda langit di malam hari dari berbagai tempat di bumi dan sejarah alam semesta.",
    image:
        'https://tse4.mm.bing.net/th?id=OIP.E7NYzzQ_9y-rUMfuJ2iTKgHaEY&pid=Api&P=0&h=180',
    urlmap: 'https://goo.gl/maps/waj8x1qW74ehtKJk7',
    jumlah: 190261,
  ),
  DataPlace(
    id: 20,
    title: "Rumah Si Pitung (Situs Marunda)",
    location: "Marunda, Kec. Cilincing, Jakarta Utara",
    description:
        "Rumah panggung yang didominasi berwarna merah delima dan coklat berdiri dilahan seluas 700 m2 dan diperkirakan dibangun pada awal abad ke 19. Berdasarkan peraturan Daerah Khusus Ibukota Jakarta No. 9 tahun 1999, Rumah Si Pitung ini telah ditetapkan sebagai Benda Cagar Budaya.",
    image:
        'https://indonesiatraveler.id/wp-content/uploads/2021/08/Marunda-Rumah-Si-Pitung3.jpg',
    urlmap: 'https://goo.gl/maps/rSwh7LZUXqc1xqSQA',
    jumlah: 35713,
  ),
  DataPlace(
    id: 21,
    title: "Kawasan Kota Tua",
    location: "Pinangsia, Taman Sari, Jakarta Barat",
    description:
        "Kawasan Kota Tua Jakarta ini melintasi wilayah Jakarta Utara dan Jakarta Barat. Kawasan ini memiliki luas sekitar 139 hektar dengan dominasi bangunan arsitektur Eropa dan Cina dari abad ke-17 hingga awal abad ke-20.",
    image:
        'https://cdn-brilio-net.akamaized.net/community/2019/11/08/22958/image_1573113193_5dc3cd69cba3d.jpg',
    urlmap: 'https://goo.gl/maps/uq26EiAhXiY4xuBf8',
    jumlah: 5777291,
  ),
];
