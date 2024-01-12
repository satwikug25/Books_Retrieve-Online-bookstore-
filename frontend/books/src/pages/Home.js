import React, { useContext } from 'react';
import axios from 'axios';
import { useState, useEffect } from 'react';
import Bookcard from '../components/Bookcard';
import { CartContext } from '../context/CartContext';

const Home = () => {
  const [books, setbooks] = useState([]);
  const { cartItems, setcartItems } = useContext(CartContext);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('http://127.0.0.1:8000/books');
        setbooks(response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []);

  return (
    <div className="max-w-screen-xl mx-auto p-4">
      <h1 className="text-3xl font-bold mb-8 text-center">HOME</h1>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
        {books.map((book) => (
          <Bookcard key={book.id} book={book} />
        ))}
      </div>
    </div>
  );
};

export default Home;
