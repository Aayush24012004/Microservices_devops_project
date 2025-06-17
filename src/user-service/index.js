const express = require("express");
const cors = require("cors");
const users = require("./data/users.json");

const app = express();
app.use(cors());

app.get("/users", (req, res) => {
  res.json(users);
});

const PORT = process.env.PORT || 3002;
app.listen(PORT, () => console.log(`User service running on port ${PORT}`));
