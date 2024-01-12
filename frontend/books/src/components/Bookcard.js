import React, { useContext } from 'react';
import { CartContext } from '../context/CartContext';

const Bookcard = ({ book }) => {
  const { cartItems, setcartItems } = useContext(CartContext);

  const addCart = (book) => {
    setcartItems([...cartItems, book]);
  };

  return (
    <div className="flex flex-col items-center p-4 m-3 shadow-lg bg-cozy-cream rounded-lg transition-transform hover:-translate-y-1 hover:shadow-2xl">
      <img src={book.url} alt={book.title} className="w-full h-64 object-cover object-center rounded-lg mb-4" />
      <div className="text-center">
        <h2 className="font-bold text-xl mb-2">{book.title}</h2>
        <h3 className="text-md mb-1">{book.author}</h3>
        <h4 className="text-sm mb-1">{book.isbn}</h4>
        <h2 className="text-lg font-semibold mb-3">${book.price}</h2>
        <button 
  onClick={() => addCart(book)}
  className="px-6 py-2 bg-button-yellow text-warm-brown rounded-full font-bold text-lg transition-colors duration-300 ease-in-out hover:bg-button-hover-yellow hover:text-white shadow-custom hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-button-hover-yellow focus:ring-opacity-50"
>
  Add to Cart
</button>
      </div>
    </div>
  );
};

export default Bookcard;
