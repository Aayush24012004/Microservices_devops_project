const express = require("express");
const app = express();
app.get("/login", (req, res) => {
  res.json({ message: "Login successful", token: "abc123" });
});
app.listen(3002, () => console.log("Auth Service on port 3002"));
