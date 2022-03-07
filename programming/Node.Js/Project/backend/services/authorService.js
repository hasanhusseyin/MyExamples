var express = require("express");

var router = express.Router();

var Author = require("../models/author");

router.post("/add", (request, response) => {
  var author = new Author(request.body);
  author.save((error, result) => {
    if (error) {
      console.log(error);
      return response.sendStatus(500).send({ message: error });
    }
    return response.sendStatus(201);
  });
});

router.get("/list", async (request, response) => {
  var authors = await Author.find({});
  response.send(authors);
});

var author = { router };

module.exports = author;
