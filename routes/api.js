var express = require('express');
var router = express.Router();
var cloudinary = require('cloudinary').v2; // images
var cervezasModel = require('./../models/cervezasModel');
var nodemailer = require('nodemailer'); //para enviar mail desde la pagina

//para listar cervezas
router.get('/cervezas', async function (req, res, next) {

    let cervezas = await cervezasModel.getCervezas();

    cervezas = cervezas.map(cervezas => {
        if (cervezas.imagen) {
            const imagen = cloudinary.url(cervezas.imagen, {
                width: 300,
                height: 300,
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

    res.json(cervezas);

});; // cierra inicial;

router.post('/contacto', async (req, res) => {
    
    const mail = {
        to: 'anmilani.dev@gmail.com',
        subject: 'Contacto desde BENMAN Cervezas web',
        html: `${req.body.nombre} se contacto a traves de la web de BENMAN Cervezas 
        y quiere mas informacion a este correo: ${req.body.email} <br>
        Además, hizo el siguiente comentario: ${req.body.mensaje} <br>
        Su tel es: ${req.body.telefono}`
    }

    const transport = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: process.env.SMTP_PORT,
        auth: {
            user: process.env.SMTP_USER,
            pass: process.env.SMTP_PASS
        }
    }); // cierra transp}

    await transport.sendMail(mail)

    res.status(201).json({
        error: false,
        message: 'Mensaje enviado'
    });
});


module.exports = router;