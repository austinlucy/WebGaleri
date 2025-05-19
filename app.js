var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

// View engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Middleware
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// Session configuration
const session = require('express-session');
app.use(session({
  secret: 'galeri_tk_secret',
  resave: false,
  saveUninitialized: false,
  cookie: { secure: false } // set to true only if using HTTPS
}));

// Middleware to make session user available in all views
app.use(function (req, res, next) {
  res.locals.user = req.session.user || null;
  next();
});

// Routes
app.use('/', indexRouter);
app.use('/users', usersRouter);

// 404 error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// General error handler
app.use(function (err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
