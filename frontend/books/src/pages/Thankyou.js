import React from 'react';
import thankYouGif from '../assets/thanks.gif'; 

const Thankyou = () => {
  return (
    <div className="flex items-center justify-center h-screen bg-cozy-cream">
      <div className="text-center">
        <h1 className="text-5xl font-bold text-warm-brown mb-4">
        Come back soon!
        </h1>
        <p className="text-xl mb-8">
        </p>
        {/* Include the gif using an img tag */}
        <img src={thankYouGif} alt="Thank you" className="mx-auto" />
      </div>
    </div>
  );
};

export default Thankyou;


