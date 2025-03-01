import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
    plugins : [react()],
    root: "./view",
    base: "/",
    build: {
        outDir: "../assets/web"
    },
    server: {
        port: 9999,
        open: true
    }
});