import '../styles/Loginpage.css';
import { useState } from 'react';
import axios from 'axios';


const URL = 'http://localhost/webshop/php/';

/* Luodaan Kirjautumis sivu*/
function Loginpage() {
  const [astunnus, setAstunnus] = useState('');
  const [salasana, setSalasana] = useState('');
  
  
  function save(e) {
    e.preventDefault()
    const json = JSON.stringify({astunnus: astunnus, salasana: salasana });
    console.log(json);
    axios.post(URL + 'logincheck.php', json, {
      headers: {
        'Content-Type': 'Application/json',

      }})


      .then((response) => {
        setAstunnus(astunnus => [...astunnus, response.data])
        setSalasana(salasana => [...salasana, response.data])
        setAstunnus('')
        setSalasana('')
        alert('Tervetuloa Retrogamershaveniin!')
        console.log(response);
      })
  }
    
  return (
    <>
      <div className="logform">
        <div className="logform__header">
          <h2 className="Loginformkirjaudu">Kirjaudu sisään!</h2>
        </div>
        <div className="logform__container">
          <form onSubmit={save}>
            <label className='Loginlabel' htmlFor="astunnus">Astunnus </label>
            <input type="texti" value={astunnus}
              onChange={(e) => setAstunnus(e.target.value)}
              placeholder="astunnus" required />
          
            <label className="Loginlabel" htmlFor="salasana">Salasana </label>
            <input type="texti" value={salasana}
              onChange={(e) => setSalasana(e.target.value)}
              placeholder="salasana" required />
              <input type="submit" value="Kirjaudu" />
           
          </form>

        </div>
      </div>
      
    </>
  );
}
export default Loginpage;