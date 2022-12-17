const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const OwnedFigures = new Schema({
    _id:
    {
        type: String,
        required: true
    },
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

mongoose.model('Ownedfigures', OwnedFigures);
