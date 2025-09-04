var pool = require('./bd'); //llamado datos de BD


async function getCervezas() {
        var query = 'select * from cervezas order by id desc';
        var rows = await pool.query(query);
        return rows;
};


async function insertCervezas(obj) {
        try {
                var query = "insert into cervezas set ? ";
                var rows = await pool.query(query, [obj]);
                return rows;
        } catch (error) {
                console.log(error);
                throw error;
        }
};

async function deleteCervezasById(id) {
        var query = "delete from cervezas where id = ? ";
        var rows = await pool.query(query, [id]);
        return rows;
};

async function getCervezasById(id) {
        var query = "select * from cervezas where id = ? ";
        var rows = await pool.query(query, [id]);
        return rows[0];
};

async function modificarCervezasById(obj, id) {
        try {
                var query = "update cervezas set ? where id = ? ";
                var rows = await pool.query(query, [obj, id]);
                return rows;
        } catch (error) {
                throw error;
        }
};


module.exports = { getCervezas, insertCervezas, deleteCervezasById, getCervezasById, modificarCervezasById };