import React, { useContext,useState,useEffect } from 'react'
import {useNavigate } from "react-router-dom"
import Bookcard from '../components/Bookcard';
import axios from 'axios';
import { SearchContext } from '../context/SearchContext';

const Search = () => {
const {search,setsearch} = useContext(SearchContext);
const [books, setbooks] = useState([]);
const navigate = useNavigate();

useEffect(() => {
    // Perform the API call when the component mounts or when searchQuery changes
    const fetchData = async () => {
      try {
        const response = await axios.get(`http://127.0.0.1:8000/book/search-by-book?q=${search}`);
        const data = response.data;
        setbooks(data)
        // Handle the response data as needed
        console.log('API Response:', response.data);
      } catch (error) {
        // Handle errors
        console.error('API Error:', error);
      }
    };

    // Check if there is a valid searchQuery before making the API call
    if (search) {
      fetchData();
    }
  }, [search]);
    

  return (
    <div className="max-w-screen-xl mx-auto p-4">
      <h1 className="text-3xl font-bold mb-8 text-center">Search</h1>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
        {books.map((book) => (
          <Bookcard book={book} />
        ))}
      </div>
    </div>
  )
}

export default Search




