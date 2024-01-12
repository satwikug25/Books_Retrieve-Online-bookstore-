import React from 'react';
import Ananyacard from '../components/Ananyacard';
import Euancard from '../components/Euancard';
import Kevalcard from '../components/Kevalcard';
import Satwikcard from '../components/Satwikcard';

const About = () => {
  return (
    <div className="max-w-screen-xl mx-auto p-4 sm:p-8 my-10 bg-gradient-to-r from-cozy-cream via-cozy-peach to-cozy-latte rounded-xl shadow-xl">
        <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold mb-6 sm:mb-12 text-center text-warm-brown">About Us</h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6 lg:gap-8">
            <Satwikcard />
            <Euancard />
            <Kevalcard />
            <Ananyacard />
        </div>
    </div>
  );
};

export default About;
