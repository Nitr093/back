var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var cors = require('cors');

require('dotenv').config();
const session = require('express-session');
var fileUpload = require('express-fileupload');


var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var loginRouter = require('./routes/admin/login');
var adminRouter = require('./routes/admin/cervezas');
var apiRouter = require('./routes/api')

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(cors({ origin: 'http://localhost:3001' }));

app.use(session({
  secret:'<~5%¿3"tVJh4<j-}1H',
  resave: false,
  saveUninitialized: true
}));

secured = async (req, res, next) => {
  try{
    console.log(req.session.id_usuario);
    if(req.session.id_usuario){
      next();
    } else {
      res.redirect('/admin/login');
    }
  } catch (error) {
    console.log(error)
  }
};

app.use(fileUpload({
  useTempFiles: true,
  tempFileDir: '/tmp/'
}));




// app.get('/', function (req, res){
//   var conocido = Boolean(req.session.nombre);

//   res.render('index', {
//     title: 'Ingreso Admin a cervezas BENMAN',
//     conocido: conocido,
//     nombre: req.session.nombre
//   });

// });

// este app.get redireccion el '/' hacia '/admin/login'. Dejo arriba de esto comentado el app.get anterior que te lleva al index
app.get('/', function (req, res){  
  res.redirect('/admin/login');
});



app.post('/ingresar', function (req, res) {
if (req.body.nombre) {
  req.session.nombre = req.body.nombre
}
res.redirect('/')
});

app.get('/salir', function (req, res){
  req.session.destroy();
  res.redirect('/');
})



app.use('/', indexRouter);
app.use('/users', usersRouter);

app.use('/admin/login', loginRouter);
app.use('/admin/cervezas', secured, adminRouter);
app.use('/api', apiRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
