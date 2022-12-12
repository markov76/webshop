import { useState } from "react";

export default function Products({url, addToCart}) {

    const [categoryName, setCategoryname] = useState('');
    const [products, setProducts] = useState([]);

    return (
        <div>
            <h3>Products for {categoryName}</h3>
                {products.map(product =>(
                    <div key={product.id}>
                        {product.name}
                        <button className="btn btn-primary" type="button" onClick={e=> addToCart(product)}>Lisää</button>
                        </div>
                ))}
        </div>
    )

}
