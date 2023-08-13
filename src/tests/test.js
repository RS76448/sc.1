const getnewstartdate = require('../utils/dateutils').getnewstartdate; // Import your getnewstartdate function
const { describe, test, expect } = require('@jest/globals');

describe('getnewstartdate function', () => {
    test('should return next occurrence when dayOnStartDate is in combosarray', () => {
        const startdate = '2023-08-15'; // Monday (day index: 1)
        const combosarray = [1, 3, 5]; // Monday, Wednesday, Friday

        const result = getnewstartdate(startdate, combosarray);
        expect(result.toISOString().split('T')[0]).toBe('2023-08-16'); // Expected next day (Tuesday)
    });

    test('should return next occurrence when dayOnStartDate is not in combosarray', () => {
        const startdate = '2023-08-15'; // Monday (day index: 1)
        const combosarray = [3, 5, 6]; // Wednesday, Friday, Saturday

        const result = getnewstartdate(startdate, combosarray);
        expect(result.toISOString().split('T')[0]).toBe('2023-08-16'); // Expected next day (Tuesday)
    });

    test('should handle cases where the next occurrence is within the same week', () => {
        const startdate = '2023-08-15'; // Monday (day index: 1)
        const combosarray = [0, 1, 2, 3, 4, 5, 6]; // All days

        const result = getnewstartdate(startdate, combosarray);
        expect(result.toISOString().split('T')[0]).toBe('2023-08-21'); // Expected Sunday (day index: 0)
    });

    test('should handle cases where the next occurrence is in the next week', () => {
        const startdate = '2023-08-15'; // Monday (day index: 1)
        const combosarray = [2, 4, 6]; // Tuesday, Thursday, Saturday

        const result = getnewstartdate(startdate, combosarray);
        expect(result.toISOString().split('T')[0]).toBe('2023-08-17'); // Expected next Tuesday
    });
});
