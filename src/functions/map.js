// /**
//  * Triggered from a message on a Cloud Pub/Sub topic.
//  *
//  * @param {!Object} event Event payload.
//  * @param {!Object} context Metadata for the event.
//  */
// exports.map = (event, context) => {
//   const message = event.data ? Buffer.from(event.data, 'base64').toString() : '';
//   console.log('(mapper) I am a mapper function', message);
// };

// MAPPER L1 - READS AND SPLITS FILE FOR NEXT LAYER MAPPERS
var fs = require('fs');

exports.map = function() {
    try {  
        const data = fs.readFileSync('test-book.txt', 'utf8').split(/\r?\n/); // read
        const splitData = splitArray(data, 1); // split data
        // read to firestore collection.
    } catch(e) {
        console.log('Error:', e.stack);
    }

    function splitArray(arr, partitions) {
        let i = 1
        let sliceIndexes = [0]
        while (i <= partitions) {
            sliceIndexes.push((arr.length / partitions) * i)
            i++
        }
        return sliceIndexes.map((_, i, array) => {
            if(i === 0) return null
            return arr.slice(array[i - 1], array[i])
        }).filter(x => x !== null)
    }
}