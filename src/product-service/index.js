const express = require("express");
const cors = require("cors");
const products = require("./data/products.json");

const app = express();
app.use(cors());

app.get("/products", (req, res) => {
  res.json(products);
});

const PORT = process.env.PORT || 3003;
app.listen(PORT, () => console.log(`Product service running on port ${PORT}`));
