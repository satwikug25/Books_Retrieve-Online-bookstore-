import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const Checkout = () => {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [phone, setPhone] = useState("");
  const [address, setAddress] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://127.0.0.1:8000/customers', {
        firstName,
        lastName,
        phone,
        address,
      });

      if (response.status === 200) {
        navigate('/Thanks');
      } else {
        console.error('Unexpected response status:', response.status);
      }
    } catch (error) {
      console.error('Error submitting form:', error);
    }
  };

  return (
    <div className="pt-10 flex justify-center items-center min-h-screen bg-cozy-cream">
      <div className="max-w-md w-full mx-auto p-8 rounded-xl shadow-lg bg-gradient-to-br from-cozy-peach to-cozy-latte bg-opacity-75"> {/* Adjusted opacity */}
        <h1 className="text-4xl font-bold mb-8 text-center text-warm-brown">Checkout</h1>
        <form onSubmit={handleSubmit} className="space-y-6">
          <div>
            <label className="block text-lg font-medium text-gray-700 mb-2">
              First Name
            </label>
            <input 
              onChange={(e) => setFirstName(e.target.value)} 
              type="text" 
              className='w-full px-4 py-3 border rounded focus:outline-none focus:ring-2 focus:ring-warm-brown-light focus:border-transparent' 
              placeholder='Enter your first name'
              required 
            />
          </div>

          <div>
            <label className="block text-lg font-medium text-gray-700 mb-2">
              Last Name
            </label>
            <input 
              onChange={(e) => setLastName(e.target.value)} 
              type="text" 
              className='w-full px-4 py-3 border rounded focus:outline-none focus:ring-2 focus:ring-warm-brown-light focus:border-transparent' 
              placeholder='Enter your last name' 
              required
            />
          </div>

          <div>
            <label className="block text-lg font-medium text-gray-700 mb-2">
              Phone Number
            </label>
            <input 
              onChange={(e) => setPhone(e.target.value)} 
              type="text" 
              className='w-full px-4 py-3 border rounded focus:outline-none focus:ring-2 focus:ring-warm-brown-light focus:border-transparent' 
              placeholder='Enter your phone number' 
              required
            />
          </div>

          <div>
            <label className="block text-lg font-medium text-gray-700 mb-2">
              Address
            </label>
            <input 
              onChange={(e) => setAddress(e.target.value)} 
              type="text" 
              className='w-full px-4 py-3 border rounded focus:outline-none focus:ring-2 focus:ring-warm-brown-light focus:border-transparent' 
              placeholder='Enter your address' 
              required
            />
          </div>

          <div>
          <button 
              type="submit" 
              className="w-full bg-warm-brown hover:bg-warm-brown-dark text-white py-3 rounded-md transition-colors duration-300"
            >
              Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Checkout;
