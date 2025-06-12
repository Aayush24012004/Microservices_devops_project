const express = require("express");
const cors = require("cors");
const jwt = require("jsonwebtoken");
const authData = require("./data/auth.json");

const app = express();
app.use(cors());
app.use(express.json());

app.post("/login", (req, res) => {
  const { username } = req.body;
  const user = authData.users.find((u) => u.username === username);
  if (!user) {
    return res.status(401).json({ error: "Invalid user" });
  }
  const token = jwt.sign({ user: user.username }, "secretkey", {
    expiresIn: "1h",
  });
  res.json({ token });
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => console.log(`Auth service running on port ${PORT}`));
