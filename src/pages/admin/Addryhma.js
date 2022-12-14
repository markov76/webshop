import React from 'react';
import AdminHeader from './AdminHeader';
import axios from 'axios';
import { useState } from 'react';

const URL = 'http://localhost/webshop/php/'; 

function Addryhma() {

  const [trnimi, setTrnimi] = useState('');
 

  function save(e) {
    e.preventDefault()
    const json = JSON.stringify({ trnimi: trnimi});
    axios.post(URL + 'admin/addtuoteryhma.php', json, {
      headers: {
        'Content-Type': 'Application/json'
      }
    })

      .then((response) => {
        setTrnimi(trnimi => [...trnimi, response.data]) 
        setTrnimi('')  
        alert('Tuoteryhma lisätty onnistuneesti!')
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
     <h1>Lisää tuoteryhmä </h1> 

     <div /* className="contact-form" */>
     <form onSubmit={save}>
            <label htmlFor="trnimi">trnimi </label>
            <input type="text" value={trnimi}
              onChange={(e) => setTrnimi(e.target.value)}
              placeholder="Lisää trnimi" required />
            <input type="submit" value="Lähetä" />        
          </form>
          </div>
    </div>
    </>
  )
}

export default Addryhma