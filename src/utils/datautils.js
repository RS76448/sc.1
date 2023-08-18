function sliceOccurences(data,element,suitablesubactivityid,workout_id) {
    for (let item of data) {
      
        if (item.e==element && item.occured>1) {
            const ofindexwithsaidworkoutid=item.index.filter(e=>e.workout_id==workout_id).length

            console.log("item",item)
            if(ofindexwithsaidworkoutid>1){
                // const indexofindex = item.index.findIndex(e=>e==suitablesubactivityid)
           
                // remove index from index field
              
                

                item.index.splice(suitablesubactivityid,1)
                // item.index.shift();
                item.occured -= 1;
            }
           
        }
    }

    
    // return data;
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



module.exports = {sliceOccurences}