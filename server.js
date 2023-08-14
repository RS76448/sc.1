const express=require("express");
const app=express()
const cors=require("cors")
app.use(cors());
const path=require("path")
const bodyParser = require('body-parser');
app.use(bodyParser.json())
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb', extended: true, parameterLimit: 50000}));
app.use(express.static(path.join(__dirname, "./src/views")));
const fitnessRouter = require("./src/fitness/fitness.router");

app.set("view engine", "ejs")


// app.use((req, res, next) => {
//     console.log("Incoming Request:");
//     console.log("Method:", req.method);
//     console.log("URL:", req.url);
//     console.log("Headers:", req.headers);
//     console.log("Body:", req.body);
//     next(); // Move on to the next middleware
// });
// By carefully inspecting your frontend code, request details, CORS configuration, and adding appropriate logging and error handling in your Express server, you should be able to identify where the issue is and work towards resolving it.








app.use('/fn',fitnessRouter)

app.listen(8000,'0.0.0.0',()=>{
    console.log("server started")
})