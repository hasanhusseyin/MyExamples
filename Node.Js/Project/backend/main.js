var express = require("express");
var mongoose = require("mongoose");
var bodyParser = require("body-parser");
var cors = require("cors");

var Author = require("./models/author.js");

var author = require("./services/authorService.js");

var app = express();
app.use(cors());
app.use(bodyParser.json());

mongoose.connect(
  "mongodb+srv://hhuseyin:hasan6131@teacherbase.hs8me.mongodb.net/myFirstDatabase?retryWrites=true&w=majority",
  (error) => {
    if (!error) {
      console.log("connected to db");
    } else {
      console.log("error detected" + error);
    }
  }
);

app.use("/author", author.router);
app.listen(8080);
