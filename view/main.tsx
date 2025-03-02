import React from 'react';
import reactDOM from 'react-dom/client';
import App from './app';

const reactRoot = document.getElementById("root");

reactDOM
    .createRoot(reactRoot as HTMLElement)
    .render(<App />);