const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcrypt');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

// Middleware cek admin
function isAdmin(req, res, next) {
  if (req.session.user && req.session.user.role === 'admin') {
    return next();
  }
  res.status(403).send('Akses ditolak. Hanya admin yang boleh.');
}

// Konfigurasi upload gambar dan audio
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    if (file.fieldname === 'image') {
      cb(null, 'public/img');
    } else if (file.fieldname === 'audio') {
      cb(null, 'public/audio');
    }
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({ storage: storage });

// Beranda
router.get('/', (req, res) => {
  res.render('home', {
    title: 'Beranda',
    user: req.session.user
  });
});

// Form tambah galeri (admin only) - sudah include kategori list
router.get('/admin/gallery/add', isAdmin, (req, res) => {
  const sqlKategori = 'SELECT nama FROM kategori';
  db.query(sqlKategori, (err, results) => {
    if (err) throw err;
    res.render('admin/gallery-add', { user: req.session.user, kategoriList: results });
  });
});

// Proses tambah galeri
router.post('/gallery/add', isAdmin, upload.fields([
  { name: 'image' },
  { name: 'audio' }
]), (req, res) => {
  const { nama, deskripsi, kategori } = req.body;
  const sqlKategori = 'SELECT id FROM kategori WHERE nama = ?';
  db.query(sqlKategori, [kategori], (err, results) => {
    if (err) throw err;
    if (results.length === 0) {
      return res.status(400).send('Kategori tidak ditemukan');
    }

    const kategoriId = results[0].id;
    const image = req.files['image'] ? req.files['image'][0].filename : null;
    const audio = req.files['audio'] ? req.files['audio'][0].filename : null;

    const sqlInsert = 'INSERT INTO objek (nama, deskripsi, image, audio, kategori_id) VALUES (?, ?, ?, ?, ?)';
    db.query(sqlInsert, [nama, deskripsi, image, audio, kategoriId], (err) => {
      if (err) throw err;
      res.redirect('/galeri/' + kategori);
    });
  });
});

// Hapus galeri (admin only)
router.post('/gallery/delete/:id', isAdmin, (req, res) => {
  const id = req.params.id;
  const sqlSelect = 'SELECT image, audio FROM objek WHERE id = ?';

  db.query(sqlSelect, [id], (err, results) => {
    if (err) throw err;
    if (results.length === 0) return res.redirect('/');

    const { image, audio } = results[0];

    const sqlDelete = 'DELETE FROM objek WHERE id = ?';
    db.query(sqlDelete, [id], (err) => {
      if (err) throw err;

      if (image) fs.unlink(`public/img/${image}`, () => {});
      if (audio) fs.unlink(`public/audio/${audio}`, () => {});
      res.redirect('back');
    });
  });
});

// Tampilkan galeri berdasarkan kategori
router.get('/galeri/:kategori', (req, res) => {
  const kategori = req.params.kategori;
  const sql = `
    SELECT objek.* FROM objek
    JOIN kategori ON objek.kategori_id = kategori.id
    WHERE kategori.nama = ?
  `;
  db.query(sql, [kategori], (err, results) => {
    if (err) throw err;
    res.render('galeri', { data: results, kategori, user: req.session.user });
  });
});

// Login admin
router.get('/login', (req, res) => {
  res.render('login', { error: null });
});

router.post('/login', (req, res) => {
  const { username, password } = req.body;
  const sql = 'SELECT * FROM users WHERE username = ? AND role = "admin"';

  db.query(sql, [username], (err, results) => {
    if (err) throw err;
    if (results.length === 0) {
      return res.render('login', { error: 'Username tidak ditemukan' });
    }

    const user = results[0];
    bcrypt.compare(password, user.password, (err, result) => {
      if (result) {
        req.session.user = user;
        res.redirect('/');
      } else {
        res.render('login', { error: 'Password salah' });
      }
    });
  });
});

// Login user biasa
router.get('/user-login', (req, res) => {
  res.render('user-login', { error: null });
});

router.post('/user-login', (req, res) => {
  const { username, password } = req.body;
  const sql = 'SELECT * FROM users WHERE username = ? AND role = "user"';

  db.query(sql, [username], (err, results) => {
    if (err) throw err;
    if (results.length === 0) {
      return res.render('user-login', { error: 'Username tidak ditemukan' });
    }

    const user = results[0];
    bcrypt.compare(password, user.password, (err, result) => {
      if (result) {
        req.session.user = user;
        res.redirect('/');
      } else {
        res.render('user-login', { error: 'Password salah' });
      }
    });
  });
});

// Registrasi user
router.get('/register', (req, res) => {
  res.render('register', { error: null });
});

router.post('/register', (req, res) => {
  const { username, password } = req.body;
  const sqlCheck = 'SELECT * FROM users WHERE username = ?';

  db.query(sqlCheck, [username], (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      return res.render('register', { error: 'Username sudah digunakan' });
    }

    bcrypt.hash(password, 10, (err, hash) => {
      const sqlInsert = 'INSERT INTO users (username, password, role) VALUES (?, ?, "user")';
      db.query(sqlInsert, [username, hash], (err) => {
        if (err) throw err;
        res.redirect('/user-login');
      });
    });
  });
});

// Logout
router.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/');
});

module.exports = router;
