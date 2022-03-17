var fs = require("fs");

fs.readFile("./file.txt", "utf-8",function (hata, data) {
  if (hata) {
    throw hata;
  }
  console.log(data.toString());
});

fs.writeFile("./file2.txt", "Hasan Hüseyin  DEMİRTAŞ",function (hata) {
    if (hata) {
      throw hata;
    }
    console.log("Yazıldı...");
  });

  fs.appendFile("./file2.txt", " DEMİRTAŞ",function (hata) {
    if (hata) {
      throw hata;
    }
    console.log("Yazıldı...");
  });

  fs.unlink("./file2.txt",function (hata) {
    if (hata) {
      throw hata;
    }
    console.log("Silindi...");
  });
