function sliceOccurences(data,element,weeknumber,suitablesubactivityid) {
    // console.log("data",data,"element",element,"suitablesubactivityid",suitablesubactivityid)
    for (let item of data) {
      
        if (item.e==element && item.occured>1) {
            console.log("before",item.index.length)
                // const indexofindex = item.index.findIndex(e=>e==suitablesubactivityid)
           
                // remove index from index field
              
                for(let i=0;i<weeknumber;i++){
                    if(item.index.length>1){
                        item.index.splice(suitablesubactivityid,1)
                    // item.index.shift();
                    item.occured -= 1;
                    }
                }

               
                console.log("after",item.index.length)
           
        }
    }

    
    // return data;
}

function sliceOccurencesfornonvolume(data,weeknumber,suitablesubactivityid) {
    let tempdata=data
    let newweeknumber=weeknumber>tempdata.length?weeknumber%tempdata.length:weeknumber
    console.log("newweeknumber",newweeknumber)
    console.log("before data",data.length)
    
    if(data.length==newweeknumber){
        data=tempdata
    }else{
        for(let i=0;i<newweeknumber;i++){
            if(tempdata.length>1){
                tempdata.splice(suitablesubactivityid,1)
            // item.index.shift();
            }
        }
    }
    console.log("newweeknumber",newweeknumber)
    console.log("after data",data.length)
}


// function sliceOccurences(data,element,workout_id) {
//     let itemtoreturn={}
//     for (let item of data) {
      
//         if (item.e==element && item.occured>1) {
//             const ofindexwithsaidworkoutid=item.index.filter(e=>e.workout_id==workout_id).length
//             const newitem=item.index.find(e=>e.workout_id==workout_id)
//             const itemindex=item.index.findIndex(e=>e.workout_id==workout_id)
//             console.log("item",item)
//             itemtoreturn=newitem
//             if(ofindexwithsaidworkoutid>2){
//                 // const indexofindex = item.index.findIndex(e=>e==suitablesubactivityid)
//                 itemtoreturn=newitem
//                 // remove index from index field
              
                

//                 // item.index.splice(itemindex,1)
//                 // // item.index.shift();
//                 // item.occured -= 1;
//             }
           
//         }
//     }

    
//     return itemtoreturn
// }


function generateRandomString(length = 12) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}

// Usage

module.exports = {sliceOccurences,generateRandomString,sliceOccurencesfornonvolume}