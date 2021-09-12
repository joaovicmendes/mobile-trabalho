const functions = require('firebase-functions');
const admin = require('firebase-admin');
const express = require('express');
const cors = require('cors');

const app = express();
admin.initializeApp();

// Courses API
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


// Users API
app.get('/users', async(req, res) => {
    const snapshot = await admin.firestore().collection('users').get();
    let users = [];
    snapshot.forEach(doc => {
        let id = doc.id;
        let data = doc.data();
        users.push({id, ...data});
    });
    res.status(200).send(JSON.stringify(users));
});

app.get('/users/:id', async (req, res) => {
    const snapshot = await admin.firestore().collection('users').doc(req.params.id).get();
    userId = snapshot.id;
    userData = snapshot.data();
    res.status(200).send(JSON.stringify({userId, ...userData}));
});

app.post('/users', async (req, res) => {
    const user = req.body;
    await admin.firestore().collection('users').add(user);
    res.status(201).send(JSON.stringify(user));
});

app.delete('/users/:id', async (req, res) => {
    const snapshot = await admin.firestore().collection('users').doc(req.params.id).get();
    await admin.firestore().collection('users').doc(req.params.id).delete();

    userId = snapshot.id;
    userData = snapshot.data();
    res.status(200).send(JSON.stringify({userId, ...userData}));
});


// Category API
app.get('/categories', async(req, res) => {
    const snapshot = await admin.firestore().collection('categories').get();
    let categories = [];
    snapshot.forEach(doc => {
        let id = doc.id;
        let data = doc.data();
        categories.push({id, ...data});
    });
    res.status(200).send(JSON.stringify(categories));
});

app.get('/categories/:id', async (req, res) => {
    const snapshot = await admin.firestore().collection('categories').doc(req.params.id).get();
    categoryId = snapshot.id;
    categoryData = snapshot.data();
    res.status(200).send(JSON.stringify({categoryId, ...categoryData}));
});

app.post('/categories', async (req, res) => {
    const category = req.body;
    await admin.firestore().collection('categories').add(category);
    res.status(201).send(JSON.stringify(category));
});

app.delete('/categories/:id', async (req, res) => {
    const snapshot = await admin.firestore().collection('categories').doc(req.params.id).get();
    await admin.firestore().collection('categories').doc(req.params.id).delete();

    categoryId = snapshot.id;
    categoryData = snapshot.data();
    res.status(200).send(JSON.stringify({categoryId, ...categoryData}));
});

exports.api = functions.https.onRequest(app);
