function sliceOccurences(data,element) {
    for (let item of data) {
      
        if (item.e==element && item.occured>1) {
            item.index.shift();
            item.occured -= 1;
        }
    }

    
    // return data;
}

module.exports = {sliceOccurences}