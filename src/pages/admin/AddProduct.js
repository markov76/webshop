import React from 'react';
import AdminHeader from './AdminHeader';
import axios from 'axios';
import { useState } from 'react';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import '../../styles/ReadContact.css'



const URL = 'http://localhost/webshop/php/';

function AddProduct() {

  const [tuotenimi, setTuotenimi] = useState('');
  const [hinta, setHinta] = useState('');
  const [saldo, setSaldo] = useState('');
  const [trnro, setTrnro] = useState('');
  const [tuotekuvaus, setTuotekuvaus] = useState('');
  const [img, setImg] = useState('');

  function save(e) {
    e.preventDefault()
    const json = JSON.stringify({
      tuotenimi: tuotenimi, hinta: hinta,
      saldo: saldo, trnro: trnro, tuotekuvaus: tuotekuvaus, img: img
    });
    axios.post(URL + 'admin/addProducts.php', json, {
      headers: {
        'Content-Type': 'Application/json'
      }
    })

      .then((response) => {
        setTuotenimi(tuotenimi => [...tuotenimi, response.data])
        setHinta(hinta => [...hinta, response.data])
        setSaldo(saldo => [...saldo, response.data])
        setTrnro(trnro => [...trnro, response.data])
        setTuotekuvaus(tuotekuvaus => [...tuotekuvaus, response.data])
        setImg(img => [...img, response.data])
        setTuotenimi('')
        setHinta('')
        setSaldo('')
        setTrnro('')
        setTuotekuvaus('')
        setImg('')
        alert('Tuote lisätty onnistuneesti!')
      })

      .catch(error => {
        console.log(error.response ? error.response.data.error : error)
        alert("Häiriö järjestelmässä, yritä pian uudelleen!")
      })
  }

  return (
    <>
      <div>
        <AdminHeader url={URL} />

        <div className="contact-form">
          <Container>
            <h1>Lisää tuote</h1>
            <form onSubmit={save}>
              <Row>
                <Col>
                  <label htmlFor="tuotenimi">tuotenimi </label>
                  <input type="text" value={tuotenimi}
                    onChange={(e) => setTuotenimi(e.target.value)}
                    placeholder="tuotteen nimi" required />
                  <label htmlFor="hinta"> hinta</label>
                  <input type="text" value={hinta}
                    onChange={(e) => setHinta(e.target.value)}
                    placeholder="esim. 29.90" required />
                  <label htmlFor="saldo"> määrä </label>
                  <input type="text" value={saldo}
                    onChange={(e) => setSaldo(e.target.value)}
                    placeholder="kpl-määrä" required />
                </Col>
                <Col> <label htmlFor="trnro">tuoteryhmänro</label>
                  <input type="text" value={trnro}
                    onChange={(e) => setTrnro(e.target.value)}
                    placeholder="tuoteryhmän numero" required />
                  <label htmlFor="tuotekuvaus">tuotekuvaus</label>
                  <input type="text" value={tuotekuvaus}
                    onChange={(e) => setTuotekuvaus(e.target.value)}
                    placeholder="tuotekuvaus" required />
                  <label htmlFor="kuva"> kuvan osoite </label>
                  <input type="text" value={img}
                    onChange={(e) => setImg(e.target.value)}
                    placeholder=" esim.lautapelit/monopoly.png" required />
                  
                </Col>
                <input type="submit" value="Lähetä" />
              </Row>

            </form>

          </Container>
        </div>
      </div>
    </>


  )
}

export default AddProduct;
