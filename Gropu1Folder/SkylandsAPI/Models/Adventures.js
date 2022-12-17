const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Adventures = new Schema({
    figureFranchise:
    {
        type: String,
        required: true
    },
    figureYear:
    {
        type: String,
        required: true
    },
    figureID:
    {
        type: String,
        required: true
    },
    figureName:
    {
        type: String,
        required: true
    },
    dateEntered:
    {
        type: Date,
        required: false
    }
});

mongoose.model('Adventures', Adventures);