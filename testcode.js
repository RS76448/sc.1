const activity_id = 1;
const RestDay = "Rest Day";

const daysoptionsmapping = {
    2: "2_days",
    3: "3_days",
    4: "4_days",
    5: "5_days",
};

const maptotextualday = {
    0: "Sunday",
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday"
};

const workoutmapping2 = {
    "Long Workout": "long_workout",
    "Medium Workout 1": "medium_workout_1",
    "Medium Workout 2": "medium_workout_2",
    "Short Workout 1": "short_workout_1",
    "Short Workout 2": "short_workout_2",
};

const generatereportv3 = async (req, res) => {
    const { startdate, daysoptions, comboselem, phaseno, goal, uid, useridentifier } = req.body;
    let changeintotalpercentageforage = 0;
    let changeintotalpercentageforfitnesslevel = 0;

    const user = await getUserById(useridentifier);
    if (user) {
        changeintotalpercentageforage = await getAgeRule(user);
        changeintotalpercentageforfitnesslevel = await getFitnessLevelRule(user);
    }

    const alldates = await generateDates(user, startdate, daysoptions, comboselem, phaseno, goal, uid);
    const randomstring = uid ? uid : generateRandomString(12);

    await saveWorkoutSchedule(alldates, daysoptions, comboselem, goal, randomstring);
    return res.json({ alldates, randomstring });
}

const getUserById = async (id) => {
    return await db.users.findOne({ where: { id: parseInt(id) } });
}

const getAgeRule = async (user) => {
    const dob = user?.dateofbirth;
    const usersAge = getAgeFromDobForUser(dob);
    if (usersAge) {
        const changeintotal = await db.rulesforage.findOne({
            where: {
                minage: { [Op.lte]: usersAge },
                maxage: { [Op.gte]: usersAge }
            }
        });
        return changeintotal.changepercentage;
    }
    return 0;
}

const getFitnessLevelRule = async (user) => {
    const fitnesslevel = await db.trainingzones.findOne({
        where: {
            user_id: parseInt(user.id),
            activity_id: activity_id
        },
        order: [['date', 'DESC']],
        limit: 1
    });

    if (fitnesslevel?.fitnesslevel_id) {
        const changeInTotalForFitnessLevel = await db.rulesforfitnesslevel.findOne({
            where: { level_id: fitnesslevel.fitnesslevel_id },
            include: [db.levels]
        });
        return changeInTotalForFitnessLevel?.changepercentage || 0;
    }
    return 0;
}

const generateDates = async (user, startdate, daysoptions, comboselem, phaseno, goal, uid) => {
    // ... (the logic related to generating dates goes here)
}

const saveWorkoutSchedule = async (alldates, daysoptions, comboselem, goal, randomstring) => {
    await db.workout_schedule.sync();
    for (let k = 0; k < alldates.length; k++) {
        let newweek = alldates[k].weekdates;
        for (let l = 0; l < newweek.length; l++) {
            let newday = newweek[l];
            await db.workout_schedule.create({
                numofrunningdays: parseInt(daysoptions),
                daysoption: parseInt(comboselem),
                week: alldates[k].week,
                identifier: randomstring,
                // ... (other properties)
            });
        }
    }
}

// Assuming the other helper functions (like getAgeFromDobForUser, getNextCycleDate, generateRandomString, sliceOccurences) are imported or defined elsewhere.
