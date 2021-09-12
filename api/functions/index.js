const functions = require('firebase-functions');
const admin = require('firebase-admin');
const express = require('express');
const cors = require('cors');

const app = express();
admin.initializeApp();

app.get('/courses', async(req, res) => {
    const snapshot = await admin.firestore().collection('courses').get();
    let courses = [];
    snapshot.forEach(doc => {
        let id = doc.id;
        let data = doc.data();
        courses.push({id, ...data});
    });
    res.status(200).send(JSON.stringify(courses));
});

app.get('/courses/:id', async (req, res) => {
    const snapshot = await admin.firestore().collection('courses').doc(req.params.id).get();
    courseId = snapshot.id;
    courseData = snapshot.data();
    res.status(200).send(JSON.stringify({courseId, ...courseData}));
});

app.post('/courses', async (req, res) => {
    const course = req.body;
    await admin.firestore().collection('courses').add(course);
    res.status(201).send(JSON.stringify(course));
});

app.delete('/courses/:id', async (req, res) => {
    const snapshot = await admin.firestore().collection('courses').doc(req.params.id).get();
    await admin.firestore().collection('courses').doc(req.params.id).delete();

    courseId = snapshot.id;
    courseData = snapshot.data();
    res.status(200).send(JSON.stringify({courseId, ...courseData}));
});

exports.api = functions.https.onRequest(app);
