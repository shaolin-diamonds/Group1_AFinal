const express = require('express');
const app = express();
const nodemon = require('nodemon');
app.use(express.json());

//MongoDB Package
const mongoose = require('mongoose');

const PORT = 1200;
let today = new Date().toLocaleDateString()

const dbUrl = "mongodb+srv://dbadmin:admin@mongo.zjgsurz.mongodb.net/skylander_tracker";

//Connect to MongoDB
mongoose.connect(dbUrl, {
        useNewUrlParser: true,
        useUnifiedTopology: true
});

//MongoDB Connection
const db = mongoose.connection;

//Handle DB Error, display connection
db.on('error', () => (
    console.error.bind(console, 'connection error: ')
));
db.once('open', () => {
    console.log('MongoDB Connected');
});

//Schema/Model Declaration
require('./Models/Adventures');
require('./Models/Giants');
require('./Models/OwnedFigures');

const Adventure = mongoose.model('Adventures');
const Giant = mongoose.model('Giants');
const Owned = mongoose.model('Ownedfigures');

app.get('/', (req,res) => {
    return res.status(200).json("{message: OK}")
});

app.get('/getAllAdventures', async (req,res) => {
    try {
        let toys = await Adventure.find({}).lean();
        return res.status(200).json({"toys" : toys});
    }
    catch {
        return res.status(500).json("{message: Failed to access figures data}");
    }
});

app.get('/getAllGiants', async (req,res) => {
    try {
        let toys = await Giant.find({}).lean();
        return res.status(200).json({"toys" : toys});
    }
    catch {
        return res.status(500).json("{message: Failed to access figures data}");
    }
});

app.get('/getMyList', async (req,res) => {
    try {
        let toys = await Owned.find({}).lean();
        return res.status(200).json({"toys" : toys});
    }
    catch {
        return res.status(500).json("{message: Failed to access figures data}");
    }
});

app.get('/findAdventures', async (req,res) => {
    try {
        let toys = await Adventure.findOne({figureName: req.body.figureName}).lean();
        return res.status(200).json(toys);
    }
    catch {
        return res.status(500).json("{message: Unable to find}");
    }
});

app.get('/findGiants', async (req,res) => {
    try {
        let toys = await Giant.find({figureName: req.body.figureName}).lean();
        return res.status(200).json(toys);
    }
    catch {
        return res.status(500).json("{message: Unable to find}");
    }
});

app.get('/findOwnedFigures', async (req,res) => {
    try {
        let toys = await Owned.find({figureName: req.body.figureName}).lean();
        return res.status(200).json(toys);
    }
    catch {
        return res.status(500).json("{message: Unable to find}");
    }
});

app.post('/addAdventures', async (req,res) => {
    try {
        let toys = {
            figureFranchise: req.body.figureFranchise,
            figureYear: req.body.figureYear,
            figureID: req.body.figureID,
            figureName: req.body.figureName,
            dateEntered: new Date()
        }

        await Adventure(toys).save().then(c => {
            return res.status(201).json("Figure Added!");
        })
    }
    catch {
        return res.status(500).json("{message: Failed to add figure - bad data}");
    }
});

app.post('/addGiants', async (req,res) => {
    try {
        let toys = {
            figureFranchise: req.body.figureFranchise,
            figureYear: req.body.figureYear,
            figureID: req.body.figureID,
            figureName: req.body.figureName,
            dateEntered: new Date()
        }

        await Giant(toys).save().then(c => {
            return res.status(201).json("Figure Added!");
        })
    }
    catch {
        return res.status(500).json("{message: Failed to add figure - bad data}");
    }
});

app.post('/addOwned', async (req,res) => {
    try {
        let toys = {
            figureFranchise: req.body.figureFranchise,
            figureYear: req.body.figureYear,
            figureID: req.body.figureID,
            figureName: req.body.figureName,
            dateEntered: new Date()
        }

        await Owned(toys).save().then(c => {
            return res.status(201).json("Figure Added!");
        })
    }
    catch {
        return res.status(500).json("{message: Failed to add figure - bad data}");
    }
});

app.post("/editAdventuresByFigureName", async (req, res) => {
    try {
        let toys = await Adventure.updateOne({fname: req.body.queryFname}, {
            figureName: req.body.figureName
        });

        if (toys) {
            return res.status(200).json("{message: figure name updated}");
        }
        else {
            return res.status(200).json("{message: no figure found}");
        }
    }
    catch {
        return res.status(500).json("{message: Failed to edit figure by queryfname - bad data}");
    }
});

app.post("/editGiantsByFigureName", async (req, res) => {
    try {
        let toys = await Giant.updateOne({fname: req.body.queryFname}, {
            figureName: req.body.figureName
        });

        if (toys) {
            return res.status(200).json("{message: figure name updated}");
        }
        else {
            return res.status(200).json("{message: no figure found}");
        }
    }
    catch {
        return res.status(500).json("{message: Failed to edit figure by queryfname - bad data}");
    }
});

app.post("/editOwnedByFigureName", async (req, res) => {
    try {
        let toys = await Owned.updateOne({fname: req.body.queryFname}, {
            figureName: req.body.figureName
        });

        if (toys) {
            return res.status(200).json("{message: figure name updated}");
        }
        else {
            return res.status(200).json("{message: no figure found}");
        }
    }
    catch {
        return res.status(500).json("{message: Failed to edit figure by queryfname - bad data}");
    }
});

app.post('/deleteAdventuresById', async (req,res) =>{
    try{
        let toys = await Adventure.findOne({_id: req.body.id});
        if(toys){
            await Adventure.deleteOne({_id: req.body.id})
            return res.status(200).json("{message: figure deleted}");
        }
        else{
            return res.status(200).json("{message: figure not found}");
        }
    }
    catch{
        return res.status(500).json("{message: Failed to delete figure by ID - bad data}");
    }
});

app.post('/deleteMyListByFigureID', async (req,res) =>{
    try{
        let toys = await Owned.findOne({figureID: req.body.figureID});
        if(toys){
            await Owned.deleteOne({figureID: req.body.figureID})
            return res.status(200).json("{message: figure deleted}");
        }
        else{
            return res.status(200).json("{message: figure not found}");
        }
    }
    catch{
        return res.status(500).json("{message: Failed to delete figure by ID - bad data}");
    }
});

app.post('/deleteGiantsById', async (req,res) =>{
    try{
        let toys = await Giant.findOne({_id: req.body.id});
        if(toys){
            await Giant.deleteOne({_id: req.body.id})
            return res.status(200).json("{message: figure deleted}");
        }
        else{
            return res.status(200).json("{message: figure not found}");
        }
    }
    catch{
        return res.status(500).json("{message: Failed to delete figure by ID - bad data}");
    }
});

app.post('/deleteOwnedById', async (req,res) =>{
    try{
        let toys = await Owned.findOne({_id: req.body.id});
        if(toys){
            await Owned.deleteOne({_id: req.body.id})
            return res.status(200).json("{message: figure deleted}");
        }
        else{
            return res.status(200).json("{message: figure not found}");
        }
    }
    catch{
        return res.status(500).json("{message: Failed to delete figure by ID - bad data}");
    }
});

app.listen(PORT, () => {
    console.log(`Server Started on port ${PORT}`);
});
