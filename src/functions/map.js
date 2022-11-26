/**
 * Triggered from a message on a Cloud Pub/Sub topic.
 *
 * @param {!Object} event Event payload.
 * @param {!Object} context Metadata for the event.
 */
exports.map = (event, context) => {
  const message = event.data ? Buffer.from(event.data, 'base64').toString() : '';
  console.log('(mapper) I am a mapper function', message);
};
