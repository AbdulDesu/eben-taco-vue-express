/*
Nama: Abdul Richard
NIM: 10123905
Kelas: Teknik Informatika 12
*/

import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import router from "./routes/routes.js";

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(cors());

app.use(router);

app.get('/', function(req, res){
    res.json({ message: 'Eben Stand API, Created By Abdul Richard' });
});

const PORT = process.env.PORT || 8081;
app.listen(PORT, () => {
  console.log(`Server berjalan pada port ${PORT}.`);
});