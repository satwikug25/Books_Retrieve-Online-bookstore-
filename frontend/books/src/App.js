
import { createContext } from "react";
import {BrowserRouter as Router,Routes,Route} from "react-router-dom";
import {Navbar} from "./components/Navbar.js";
import { CartContext } from "./context/CartContext.js";
import About from "./pages/About.js";
import { useState } from "react";

import Cart from "./pages/Cart.js";
import Checkout from "./pages/Checkout.js";
import Home from "./pages/Home.js";
import Thankyou from "./pages/Thankyou.js";
import { SearchContext } from "./context/SearchContext.js";
import Search from "./pages/Search.js";





function App() {
  const [cartItems, setcartItems] = useState([]);
  const [search, setsearch] = useState("");


  return (
    <SearchContext.Provider value={{search,setsearch}}>
    <CartContext.Provider value={{cartItems,setcartItems}}>
      
      <Router>
        <Navbar />
        
        <Routes>
          <Route path = "/" element ={<Home/>}/>
          <Route path = "/Search" element ={<Search/>}/>
          <Route path = "/cart" element={<Cart/>}/>
          <Route path = "/checkout" element={<Checkout/>} />
          <Route path = "/About" element={<About/>}/>
          <Route path = "/Thanks" element={<Thankyou/>}/>
          
        </Routes>
        
        
        

      </Router>
      
    </CartContext.Provider>
    </SearchContext.Provider>
      
      
    
  );
}

export default App;
