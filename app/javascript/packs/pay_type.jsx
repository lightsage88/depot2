import React from 'react'
//How we get access to the React library
import ReactDOM from 'react-dom'
//Brings in the ReactDOM object which has the render function we need to
//bootstrap our React component
import PayTypeSelector from 'PayTypeSelector'
//We are importing a component that we are about to make

document.addEventListener('turbolinks:load', function(){
    var element = document.getElementById("pay-type-component");
    ReactDOM.render(<PayTypeSelector />, element);
});
//The use of turbolinks is at play. instead of using React's DOMContentLoaded lifecycle method
//We instead listen for the 'turbolinks:load' event that is emitted instead.