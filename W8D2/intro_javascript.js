function madLib(verb, adj, noun) {
    console.log(`We shall ${verb} the ${adj} ${noun}`);
}

madLib('eat', 'most', 'peppers');

function isSubString(searchString, subString) {
    var reg = new RegExp(subString)
    if (reg.test(searchString)) {
        console.log(true);
    } else {
        console.log(false);
    }
}

function fizzBuzz(array) {
    let new_arr = []

    array.forEach(numCheck)

    function numCheck(num) {
        if (num % 3 === 0 || num % 5 === 0) {
            new_arr.push(num);
        }
    }
    console.log(new_arr);
}