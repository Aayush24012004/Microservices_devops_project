const express = require("express");
const app = express();
app.get("/users", (req, res) => {
  res.json([
    { id: 1, name: "Aayush" },
    { id: 2, name: "Jane" },
  ]);
});
app.listen(3001, () => console.log("User Service on port 3001"));
