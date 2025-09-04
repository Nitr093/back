var express = require('express');
var router = express.Router();

var util = require('util');
var cloudinary = require('cloudinary').v2;
const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy)

var cervezasModel = require('../../models/cervezasModel')

//para listar cervezas

router.get('/', async function (req, res, next) {

  var cervezas = await cervezasModel.getCervezas();

  cervezas = cervezas.map(cervezas => {
    if (cervezas.imagen) {
      const imagen = cloudinary.image(cervezas.imagen, {
        width: 100,
        height: 100,
        crop: 'fill'
      });
      return {
        ...cervezas,
        imagen
      }
    } else {
      return {
        ...cervezas,
        imagen: ''
      }
    }
  });

  res.render('admin/cervezas', { //cervezas hbs
    layout: 'admin/layout', //layout 
    persona: req.session.nombre,
    cervezas
  });
}); // cierra inicial

router.get('/agregar', (req, res, next) => {
  res.render('admin/agregar', { //agregar.hbs
    layout: 'admin/layout', //layout       
  }); //cierra render
}); //cierra get

router.post("/agregar", async (req, res, next) => {
  try {

    var imagen = '';
    if (req.files && Object.keys(req.files).length > 0) {
      imagen = req.files.imagen;
      imagen = (await uploader(imagen.tempFilePath)).public_id;
    }

    if (req.body.nombre != "" && req.body.descripcion != "" && req.body.proceso != "") {

      await cervezasModel.insertCervezas({ ...req.body, imagen });

      res.redirect("/admin/cervezas")
    }
    else {
      res.render("admin/agregar", {
        layout: "admin/layout",
        error: true, message: "Todos los campos son requeridos para guardar una nueva cerveza !"
      })
    }
  } catch (error) {
    console.log(error)
    res.render("admin/agregar", {
      layout: "admin/layout",
      error: true, message: "No se cargo la cerveza"
    });
  }
});

//para eliminar una cerveza by id

router.get("/eliminar/:id", async (req, res, next) => {
  var id = req.params.id;

  let cervezas = await cervezasModel.getCervezasById(id);
  if (cervezas.imagen) {
    await (destroy(cervezas.imagen)); //eliminar imagen al eliminar cerveza
  }

  await cervezasModel.deleteCervezasById(id);
  res.redirect("/admin/cervezas")
});

//para modificar cerveza by id

router.get("/modificar/:id", async (req, res, next) => {
  let id = req.params.id;
  let cervezas = await cervezasModel.getCervezasById(id);
  res.render("admin/modificar", {
    layout: "admin/layout",
    cervezas
  });
});

router.post('/modificar', async (req, res, next) => {
  try {

    let imagen = req.body.imagen;

    let borrar_img_vieja = false;

    if (req.body.img_delete === "1") {
      imagen = null;
      borrar_img_vieja = true;
    } else if (req.files && Object.keys(req.files).length > 0 && req.files.imagen) {
      imagen = (await uploader(req.files.imagen.tempFilePath)).public_id;
      borrar_img_vieja = true;
    }
    // Caso 3: No se sube imagen ni se marca eliminar, mantener la imagen existente
    else {
      imagen = req.body.img_original; // Mantener la imagen original
    }
    
    if (borrar_img_vieja && req.body.img_original) {
      await (destroy(req.body.img_original));
    }

    var obj = {
      nombre: req.body.nombre,
      abv: req.body.abv,
      ibu: req.body.ibu,
      descripcion: req.body.descripcion,
      proceso: req.body.proceso,
      imagen
    }
    await cervezasModel.modificarCervezasById(obj, req.body.id);
    res.redirect('/admin/cervezas');
  }
  catch (error) {
    console.log(error)
    res.render('admin/modificar', {
      layout: 'admin/layout',
      error: true,
      message: 'No se modifico la cerveza'
    })
  }
});


module.exports = router;