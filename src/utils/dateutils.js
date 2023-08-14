function getNextCycleDate(inputDate, combosArray) {

    inputDate = new Date(inputDate);
    const dayIndex = inputDate.getDay();
    const nextCycleDayIndex = combosArray[0];
    const daysUntilNextCycle = (nextCycleDayIndex + 7 - dayIndex) % 7;

    const nextCycleDate = new Date(inputDate);
    if (daysUntilNextCycle === 0) {
        nextCycleDate.setDate(nextCycleDate.getDate() + 7);
    }
    else {
        nextCycleDate.setDate(nextCycleDate.getDate() + daysUntilNextCycle);
    }
    console.log("nextCycleDate", nextCycleDate)
    return nextCycleDate;
}




// function testgetnewstartdate() {
//     let startdate = "2023-08-01"
//     let combosarray = [1, 3, 5]
//     let newstartdate = getNextCycleDate(startdate, combosarray)

//     console.log("newstartdate", newstartdate)
// }
// testgetnewstartdate()




// function getnewstartdate(startdate, combosarray) {
//     // let newstartdate=new Date(startdate)
//     const dayonstartdate = new Date(startdate).getDay();
//     let datetoreturn = new Date(startdate)
//     let daytostarton = combosarray.find(e => e == dayonstartdate)
//    console.log("called at combosarray",combosarray)
//     if (daytostarton) {
//         let daysdiff = daytostarton - dayonstartdate
//         if (daysdiff > 0) {
//             datetoreturn = new Date(new Date(startdate).getDate() + daysdiff)
//             console.log("days diff>0",daysdiff,"daytostaton",dayonstartdate,"dayonstartdate",dayonstartdate)
//         }else if(daysdiff==0){
//             console.log("days diff==0",daysdiff,"daytostaton",dayonstartdate,"dayonstartdate",dayonstartdate,"new Date(startdate).getDate() + 6",new Date(startdate).getDate() + 7)
//             datetoreturn = new Date(new Date(startdate).getTime() + 7 * 24 * 60 * 60 * 1000);

//         }

//     } else {
//         for (let i = 1; i < 8; i++) {
//             let newstartdate = new Date(startdate);
//             newstartdate.setDate(newstartdate.getDate() + i); // Add i days to the start date

//             let newdayinloop = newstartdate.getDay();
//             let isthereamatch = combosarray.find(e => e == newdayinloop)

//             if (isthereamatch) {

//                 datetoreturn = new Date(newstartdate)
//                 console.log("called at i", i)
//                 break;
//             }



//         }
//     }
//     console.log("date returned",datetoreturn)
//     return datetoreturn

// }
// function getNextDateInCombosArray(inputDate, combosArray) {
//     const dayIndex = inputDate.getDay();
//     let nextDate = new Date(inputDate);

//     // Check if the input day is within the combos array
//     if (combosArray.includes(dayIndex)) {
//         // Check if there are remaining days in the combos array after the input day
//         const remainingDays = combosArray.slice(combosArray.indexOf(dayIndex) + 1);
//         console.log("remainingDays",remainingDays)
//         if (remainingDays.length > 0) {
//             nextDate.setDate(nextDate.getDate() + remainingDays[0] - dayIndex);
//         } else {
//             nextDate.setDate(nextDate.getDate() + 7 - dayIndex + combosArray[0]);
//         }
//     } else {
//         // Calculate days until the next cycle starts
//         const nextCycleDayIndex = combosArray[0];
//         const daysUntilNextCycle = (nextCycleDayIndex + 7 - dayIndex) % 7;
//         nextDate.setDate(nextDate.getDate() + daysUntilNextCycle);
//     }

//     return nextDate;
// }
module.exports = { getNextCycleDate }