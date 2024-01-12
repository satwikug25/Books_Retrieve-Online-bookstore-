import React, { useContext } from 'react';
import { Link } from 'react-router-dom';
import CartItem from '../components/CartItem';
import { CartContext } from '../context/CartContext';

const Cart = () => {
  const { cartItems } = useContext(CartContext);

  return (
    <div className="bg-cozy-cream min-h-screen pt-20 pb-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-4xl font-bold mb-8 text-center text-warm-brown">Your Cart</h1>
        
        {cartItems.length === 0 ? (
          <p className="text-center text-lg">Your cart is empty.</p>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {cartItems.map((book) => (
              <CartItem key={book.isbn} book={book} />
            ))}
          </div>
        )}
        
        {cartItems.length > 0 && (
          <div className="mt-10 flex justify-center">
            <Link to="/Checkout">
              <button className="bg-button-yellow hover:bg-button-hover-yellow text-white py-3 px-6 rounded-md transition duration-300">
                Proceed to Checkout
              </button>
            </Link>
          </div>
        )}
      </div>
    </div>
  );
};

export default Cart;
