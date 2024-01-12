import React from 'react';
import euan from '../assets/euan.jpg';

const Euancard = () => {
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
    window.open('https://github.com/euanblackstone', '_blank', 'noopener,noreferrer');
  };
  

  return (
    <div className="rounded-lg overflow-hidden shadow-lg hover:shadow-2xl transform hover:-translate-y-5 transition duration-300 ease-in-out" 
         style={containerStyle}
         onClick={handleClick}>
      <img src={euan} alt="Euan Pic" className="h-60 rounded-full mx-auto mb-4" />
      <h2 className="text-2xl font-bold mb-2">Euan Blackstone</h2>
      <p className="text-md mb-4">Back-End Developer</p>
    </div>
  );
};

export default Euancard;
