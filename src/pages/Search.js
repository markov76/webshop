import axios from 'axios';
import { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import '../App.css';
import '../styles/Tuotteet.css'
import '../styles/Tarjoussivu.css'



const url = 'http://localhost/webshop/php/';


export default function Searchproducts() {

    const [name, setName] = useState('');
    const [products, setProducts] = useState([]);

    let params = useParams();

    useEffect(() => {

        let address = '';

        address = url + 'products/search.php/' + params.searchPhrase;
        console.log(address);

        axios.get(address)
            .then((response) => {
                const json = response.data;

                setName(params.searchPhrase);
                setProducts(json);
            }).catch(error => {
                alert(error.response === undefined ? error : error.response.data.error)
    
            })
    }, [params])

    return (
      <>
        <div>
          <section className="tarjoukset" style={{ textalign: "center" }}>
            <div className="container py-5">
              <h1 className="text-center">Hakutulos</h1>
    
              <div className="row gy-5 d-flex justify-content-center">
                {products.length === 0 && (
                  <p className="text-center">Ei hakutuloksia nimellä "{name}"</p>
                )}
                
                {products.map(tuote => (
                  <div className="col-lg-3">
                    <div className="card h-100">
                      <img src={"../../images/" + tuote.img} className="img-fluid mb-3" alt="" />
                      <input type="button" onClick={() => window.location.href = './Products/xbox'} value="OSTA TÄSTÄ" />
                      <h3 className="tuotenimi2">{tuote.tuotenimi}</h3>
                      <p><span className='tuote'>{tuote.hinta}</span></p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </section>
        </div>
      </>
    );
    

    
    
}

