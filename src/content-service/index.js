const express = require("express");
const app = express();
app.get("/content", (req, res) => {
  res.json([
    { id: 101, title: "Movie A" },
    { id: 102, title: "Movie B" },
  ]);
});
app.listen(3003, () => console.log("Content Service on port 3003"));
