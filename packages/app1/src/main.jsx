import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import { BrowserRouter, Link, Route, Routes } from 'react-router-dom'
import './App.css'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/app1" element={<App />} />
        <Route path="*" element={<>You're still at app1!!!<br/><Link to="/app1/">go back</Link></>} />
      </Routes>
    </BrowserRouter>
  </StrictMode>,
)
