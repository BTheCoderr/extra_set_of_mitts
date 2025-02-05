const admin = require('firebase-admin');
const config = require('./config');

// Initialize Firebase Admin
const serviceAccount = {
    type: config.firebase.type,
    project_id: config.firebase.project_id,
    private_key_id: config.firebase.private_key_id,
    private_key: config.firebase.private_key?.replace(/\\n/g, '\n'),
    client_email: config.firebase.client_email,
    client_id: config.firebase.client_id,
    auth_uri: config.firebase.auth_uri,
    token_uri: config.firebase.token_uri,
    auth_provider_x509_cert_url: config.firebase.auth_provider_x509_cert_url,
    client_x509_cert_url: config.firebase.client_x509_cert_url
};

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    storageBucket: `${config.firebase.project_id}.appspot.com`
});

const bucket = admin.storage().bucket();

module.exports = {
    bucket,
    admin
}; 