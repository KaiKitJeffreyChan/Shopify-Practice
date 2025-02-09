import React from "react";
import ReactDOM from "react-dom";

const ExampleComponent = () => {
  return <h1>Hello from React!</h1>;
};

document.addEventListener("DOMContentLoaded", () => {
  const element = document.getElementById("example-component");
  if (element) {
    ReactDOM.render(<ExampleComponent />, element);
  }
});
