function getnewstartdate(startdate, combosarray) {
    // let newstartdate=new Date(startdate)
    const dayonstartdate = new Date(startdate).getDay();
    let datetoreturn = new Date(startdate)
    let daytostarton = combosarray.find(e => e == dayonstartdate)
   console.log("called at combosarray",combosarray)
    if (daytostarton) {
        let daysdiff = daytostarton - dayonstartdate
        if (daysdiff > 0) {
            datetoreturn = new Date(new Date(startdate).getDate() + daysdiff)
            console.log("days diff>0",daysdiff,"daytostaton",dayonstartdate,"dayonstartdate",dayonstartdate)
        }else if(daysdiff==0){
            console.log("days diff==0",daysdiff,"daytostaton",dayonstartdate,"dayonstartdate",dayonstartdate,"new Date(startdate).getDate() + 6",new Date(startdate).getDate() + 7)
            datetoreturn = new Date(new Date(startdate).getTime() + 7 * 24 * 60 * 60 * 1000);
        
        }

    } else {
        for (let i = 1; i < 8; i++) {
            let newstartdate = new Date(startdate);
            newstartdate.setDate(newstartdate.getDate() + i); // Add i days to the start date

            let newdayinloop = newstartdate.getDay();
            let isthereamatch = combosarray.find(e => e == newdayinloop)

            if (isthereamatch) {

                datetoreturn = new Date(newstartdate)
                console.log("called at i", i)
                break;
            }



        }
    }
    console.log("date returned",datetoreturn)
    return datetoreturn

}

module.exports = { getnewstartdate }