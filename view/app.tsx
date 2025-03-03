import { BrowserRouter, Route, Routes } from "react-router-dom";
import ThreeEditor from "./components/three-editor";
import PostAddressLayout from "./components/post-address-layout";

const App = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="post" element={<PostAddressLayout />} />
        <Route path="edit" element={<ThreeEditor />} />
        <Route path="/" element={<ThreeEditor />} />
      </Routes>
    </BrowserRouter>
  );
};

export default App;
