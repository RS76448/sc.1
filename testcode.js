function generatereport(req, res){
        const { startdate, daysoptions, comboselem } = req.body;
        console.log("req.body",req.body)
        const combosArray = comboselem.split(" ").map(e => parseInt(e));
        const totalweeks = 4;
        const totaldays = totalweeks * 7;
        const maptotextualday = {
            0: "Sunday",
            1: "Monday",
            2: "Tuesday",
            3: "Wednesday",
            4: "Thursday",
            5: "Friday",
            6: "Saturday"
        };
    
        let newstartday = getNextCycleDate(startdate, combosArray);
        const alldates = [];
        let week = [];
    
        for (let i = 0; i < totaldays; i++) {
            let weeknumber = parseInt(i/7)+1// Use Math.floor for better readability
            console.log("weeknumber",weeknumber)
            if ((i + 1) % 7 === 0) {
                let weekrunningquota = runningquotas?.find(e =>e.week==weeknumber);
              
                // console.log("weekrunningquota",weekrunningquota)
             
                let exersiceobj = weekrunningquota?.exersicequatos?.find(e => e.days === parseInt(daysoptions));
                
                // total saved quota
                let totalquota = exersiceobj?.totalquota;

                //total quoata as added from days quota
                // let totaladdedquota=exersiceobj.workouts.reduce((acc,curr)=>{return acc+curr.pert},0)
                week.map((day,index)=>{
                    // console.log("exersiceobj.workouts[index].pert",exersiceobj.workouts[index].pert)
                    day.quota=totalquota*(exersiceobj.workouts[index].pert/100)
                    console.log("day.quota",day.quota)
                    console.log("exerciseobj.workouts[index].pert",exersiceobj.workouts[index].pert)

                    day.totalquota=totalquota
                })
                alldates.push({ week: weeknumber, weekdates: [...week], totalquota });
                week = [];
            }
    
            let date = new Date(newstartday);
            date.setDate(date.getDate() + i);
            let newdate = date.toISOString().split("T")[0];
            let newday = date.getDay();
    
            if (combosArray.includes(newday)) {
                week.push({
                    newdate,
                    newday: maptotextualday[newday],
                    newweek: parseInt(weeknumber)
                });
            }
        }
    
        return res.json({ alldates });
    }



    function generatereport(req, res) {
      const { startdate, daysoptions, comboselem } = req.body;
      console.log("req.body", req.body);
      const combosArray = comboselem.split(" ").map(e => parseInt(e));
      const totalweeks = 4;
      const totaldays = totalweeks * 7;
      const maptotextualday = {
        0: "Sunday",
        1: "Monday",
        2: "Tuesday",
        3: "Wednesday",
        4: "Thursday",
        5: "Friday",
        6: "Saturday"
      };
    
      let newstartday = getNextCycleDate(startdate, combosArray);
      const alldates = [];
    
      for (let i = 0; i < totaldays; i++) {
        let weeknumber = Math.floor(i / 7) + 1;
        console.log("weeknumber", weeknumber);
    
        if ((i + 1) % 7 === 0) {
          let weekrunningquota = runningquotas?.find(e => e.week == weeknumber);
          let exersiceobj = weekrunningquota?.exersicequatos?.find(e => e.days === parseInt(daysoptions));
          let totalquota = exersiceobj?.totalquota;
    
          let week = alldates[alldates.length - 1]?.weekdates || [];
          week.forEach((day, index) => {
            day.quota = totalquota * (exersiceobj.workouts[index].pert / 100);
            console.log("day.quota", day.quota);
            console.log("exerciseobj.workouts[index].pert", exersiceobj.workouts[index].pert);
            day.totalquota = totalquota;
          });
    
          alldates.push({ week: weeknumber, weekdates: week, totalquota });
        }
    
        let date = new Date(newstartday);
        date.setDate(date.getDate() + i);
        let newdate = date.toISOString().split("T")[0];
        let newday = date.getDay();
    
        if (combosArray.includes(newday)) {
          alldates[alldates.length - 1]?.weekdates.push({
            newdate,
            newday: maptotextualday[newday],
            newweek: parseInt(weeknumber)
          });