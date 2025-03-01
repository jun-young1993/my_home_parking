import React from 'react';
import reactDOM from 'react-dom/client';

const reactRoot = document.getElementById("root");

reactDOM
    .createRoot(reactRoot as HTMLElement)
    .render(
        <div>
            <h1>아무거나 적는 내용</h1>
            <h2>두번째 적는 내용</h2>
        </div>
    );