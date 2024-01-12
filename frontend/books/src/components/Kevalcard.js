import React from 'react';
import keval from '../assets/WhatsApp Image 2023-12-02 at 21.39.38.jpeg'

const Kevalcard = () => {
  const containerStyle = {
    backgroundColor: 'rgba(255, 255, 255, 0.2)', // Adjust the alpha value for more or less transparency
    borderRadius: '20px',
    backdropFilter: 'blur(10px)',
    boxShadow: '0 4px 6px rgba(0.1, 0.1, 0.1, 0.2)',
    border: '1px solid rgba(255, 255, 255, 0.3)',
    padding: '20px',
    margin: '20px auto', // Center the card horizontally
    transition: 'transform 0.3s ease-in-out',
    textAlign: 'center', // Center align the text
    maxWidth: '300px', // Limit the width of the card
    cursor: 'pointer', // Change cursor on hover
  };
  const handleClick = () => {
    window.open('https://www.linkedin.com/in/keval-shah14/', '_blank', 'noopener,noreferrer');
  };
  
  return (
    <div 
      className="rounded-lg overflow-hidden shadow-lg hover:shadow-2xl transform hover:-translate-y-5 transition duration-300 ease-in-out cursor-pointer" 
      style={containerStyle}
      onClick={handleClick} // Add the onClick event handler
    >
      <img src={keval} alt="Keval Shah" className="h-60 rounded-full mx-auto mb-4" />
      <h2 className="text-2xl font-bold mb-2">Keval Shah</h2>
      <p className="text-md mb-4">Back-End Developer</p>
    </div>
  );
};
export default Kevalcard;