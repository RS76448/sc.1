function convertToSQLTimeFormat(timeString) {
    // Check for format HH:MM:SS
    let match = timeString.match(/^(\d{1,2}):(\d{1,2}):(\d{1,2})$/);
    if (match) {
        return match[1] + ':' + match[2] + ':' + match[3];
    }

    // Check for format HH:MM
    match = timeString.match(/^(\d{1,2}):(\d{1,2})$/);
    if (match) {
        return match[1] + ':' + match[2] + ':00';
    }

    // Check for format HHh MMm SSs
    match = timeString.match(/^(\d{1,2})h (\d{1,2})m (\d{1,2})s$/);
    if (match) {
        return match[1] + ':' + match[2] + ':' + match[3];
    }

    // Check for format HHh MMm
    match = timeString.match(/^(\d{1,2})h (\d{1,2})m$/);
    if (match) {
        return match[1] + ':' + match[2] + ':00';
    }

    // Check for format HH hours MM minutes SS seconds
    match = timeString.match(/^(\d{1,2}) hours (\d{1,2}) minutes (\d{1,2}) seconds$/);
    if (match) {
        return match[1] + ':' + match[2] + ':' + match[3];
    }

    // Check for format HH hours MM minutes
    match = timeString.match(/^(\d{1,2}) hours (\d{1,2}) minutes$/);
    if (match) {
        return match[1] + ':' + match[2] + ':00';
    }
    match = timeString.match(/^(\d{1,2})$/);
    if (match) {
        return '00:' + match[1].padStart(2, '0') + ':00';
    }
    // If no formats match, return the original string
    return timeString;
}

// Usage:
module.exports = {convertToSQLTimeFormat};
