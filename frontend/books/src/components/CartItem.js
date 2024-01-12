import React, { useContext, useState } from 'react';
import { CartContext } from '../context/CartContext';

const CartItem = ({ book }) => {
  const { cartItems, setcartItems } = useContext(CartContext);
  const [qty, setQty] = useState(book.quantity || 1); // Assuming book.quantity holds the initial quantity

  const removeFromCart = (bookToRemove) => {
    const updatedCartItems = cartItems.filter((item) => item.isbn !== bookToRemove.isbn);
    setcartItems(updatedCartItems);
  };

  // Function to handle quantity change
  const updateQuantity = (newQuantity) => {
    setQty(newQuantity);
    // Update the cart context with new quantity
    const updatedCartItems = cartItems.map((item) => {
      if (item.isbn === book.isbn) {
        return { ...item, quantity: newQuantity };
      }
      return item;
    });
    setcartItems(updatedCartItems);
  };

  return (
    <div className="flex flex-col items-center p-4 m-3 shadow-lg bg-cozy-cream rounded-lg transition-transform hover:-translate-y-1 hover:shadow-2xl">
      <img 
        src={book.url} 
        alt={book.title} 
        className="w-full h-64 object-contain rounded-lg mb-4" // Changed to object-contain
      />
      <div className="text-center">
        <h2 className="font-bold text-xl mb-2">{book.title}</h2>
        <h3 className="text-md mb-1">{book.author}</h3>
        <h4 className="text-sm mb-1">{book.isbn}</h4>
        <h2 className="text-lg font-semibold mb-3">${book.price}</h2>
        <div className="flex items-center justify-center mb-4">
          <button onClick={() => updateQuantity(Math.max(0, qty - 1))} className="px-3 py-1 bg-button-yellow text-warm-brown rounded-l-full font-bold text-lg transition-colors duration-300 ease-in-out hover:bg-button-hover-yellow hover:text-white shadow-custom hover:shadow-lg">
            -
          </button>
          <input className="w-12 text-center border-none" type="number" min="0" value={qty} onChange={(e) => updateQuantity(Math.max(0, parseInt(e.target.value)))} />
          <button onClick={() => updateQuantity(qty + 1)} className="px-3 py-1 bg-button-yellow text-warm-brown rounded-r-full font-bold text-lg transition-colors duration-300 ease-in-out hover:bg-button-hover-yellow hover:text-white shadow-custom hover:shadow-lg">
            +
          </button>
        </div>
        <button onClick={() => removeFromCart(book)} className="px-4 py-2 bg-button-yellow text-warm-brown rounded-full font-bold text-lg transition-colors duration-300 ease-in-out hover:bg-button-hover-yellow hover:text-white shadow-custom hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-button-hover-yellow focus:ring-opacity-50">
          Remove From Cart
        </button>
      </div>
    </div>
  );
};

export default CartItem;
