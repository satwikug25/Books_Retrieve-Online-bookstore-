import React from 'react';
import satwik from '../assets/67f27fb6-b975-478b-9cdd-e10751a3361d.jpeg'


const Satwikcard = () => {
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
    window.open('https://www.linkedin.com/in/smallaj/', '_blank', 'noopener,noreferrer');
  };
  


  return (
    <div className="rounded-lg overflow-hidden shadow-lg hover:shadow-2xl transform hover:-translate-y-5 transition duration-300 ease-in-out" 
         style={containerStyle}
         onClick={handleClick}>
      <img src={satwik} alt="Satwik Pic" className="h-60 rounded-full mx-auto mb-4" />
      <h2 className="text-2xl font-bold mb-2">Satwik Mallajosyula</h2>
      <p className="text-md mb-4">Front-End Developer</p>
    </div>
  );
};

export default Satwikcard;