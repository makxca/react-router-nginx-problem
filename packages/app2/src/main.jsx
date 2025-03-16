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
        <Route path="/app2" element={<App />} />
        <Route path="*" element={<>You're still at app2!!!<br/><Link to="/app2/">go back</Link></>} />
      </Routes>
    </BrowserRouter>
  </StrictMode>,
)
