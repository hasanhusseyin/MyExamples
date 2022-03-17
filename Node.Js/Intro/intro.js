var http = require("http");
var log = require("./log.js");
var sayHello = require("./exportsDemo.js");

http
  .createServer(function (request, response) {
    if (request.url == "/admin") {
      response.writeHead(200, { "Content-Tyoe": "text/html" });
      response.write("Admin Syafası");
    } else if (request.url == "/") {
      response.writeHead(200, { "Content-Tyoe": "text/html" });
      response.write("Ana Sayfa");
    } else if (request.url == "/customer") {
      response.writeHead(200, { "Content-Tyoe": "application/json" });
      response.write(
        JSON.stringify({ name: "Hasan Hüseyin", surName: "DEMİRTAŞ" })
      );
    }
    response.end("Sayfa Sonu" /*End ile Bitirmek zorunludur.*/);
  })
  .listen(8080);
log.information("Sunucu Yayına Keçeeyi");
console.log(sayHello());
