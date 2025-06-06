const express = require("express");
const app = express();
app.get("/languages", (req, res) => {
  res.json(["English", "Hindi", "Tamil", "Spanish"]);
});
app.listen(3004, () => console.log("Language Service on port 3004"));
