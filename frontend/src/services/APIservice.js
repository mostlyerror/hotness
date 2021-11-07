const API_URL = 'http://localhost:3000/api'

export const getNotes = () => {
  return fetch(`${API_URL}/notes`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    }
  }).then(res => res.json())
}

export const addNote = (title, content) => {
  return fetch(`${API_URL}/notes`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ title, content })
  }).then(res => res.json())
}