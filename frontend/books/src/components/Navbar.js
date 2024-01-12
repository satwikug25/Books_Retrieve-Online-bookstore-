import React, { useContext } from 'react'
import { Link, useNavigate } from "react-router-dom"
import { IconButton } from '@chakra-ui/react';
import { faShoppingCart } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import logo from '../assets/ReadersRetreatLogo.png'; // Make sure the path to your logo is correct
import { useState } from 'react';
import { SearchContext } from '../context/SearchContext';
import axios from 'axios';
import Search from '../pages/Search';



export const Navbar = () => {
  const {search,setsearch} = useContext(SearchContext);
  const navigate = useNavigate();

  const handleChange = (e) =>{
    setsearch(e.target.value);

  }
  

    







  
  
  

  return (
    <div className='bg-[#FAF3E0] p-4 flex items-center shadow-md'>
        <div className="container mx-auto flex justify-between items-center">
          <Link to="/" className='flex items-center'>
            <img src={logo} alt="Readers Retreat" className="mr-3 h-12" />
            <span className='text-2xl font-bold text-[#7D5A50]'>Readers Retreat</span>
          </Link>

          <div className='flex-1 mx-4'>
            <input type="text" onChange={handleChange} value={search} className="px-3 py-2 w-full border rounded focus:outline-none focus:ring focus:border-blue-300" placeholder="Search"/>
            <div> 
              <button onClick={()=>navigate("/Search")}>Search</button>
            </div> 
          </div>

          <div className='flex items-center space-x-4'>
              <Link to="/" className='text-[#7D5A50]'>Home</Link>
              <Link to="/About" className='text-[#7D5A50]'>About Us</Link>
              <Link to="/cart" className='text-[#7D5A50]'>
                <FontAwesomeIcon icon={faShoppingCart} />
              </Link>
          </div>
        </div>
    </div>
  );
}
