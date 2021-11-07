import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';
import { addNote, getNotes } from './services/APIservice'

const NotesCard = (props) => {
  const { title, content, id } = props;

  const handleDelete = () => {
    // deleteNote(id).then(props.onDelete);
  };

  return (
    <div className="card">
      <span><b>{title}</b></span>
      <p>{content}</p>
      {/* <button onClick={handleDelete} className="card-button">Delete</button> */}
    </div>
  )
}

const NotesForm = (props) => {

  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = (evt) => {
    evt.preventDefault();
    addNote(title, content)
      .then(res => {
        console.log(res)
        props.handleNoteAdded();
        setTitle('')
        setContent('')
        setError('')
      })
      .catch(e => { 
        console.error(e)
        setError('Error occurred while adding note')
      })
  };

  return (
    <div>
      <form style={{ display: 'inline-grid' }} onSubmit={handleSubmit}>
        <input type="text" placeholder="Title" className="input" onChange={e => setTitle(e.target.value)} defaultValue={title} />
        <textarea type="text" placeholder="Content" className="input" onChange={e => setContent(e.target.value)} defaultValue={content} />
        <input type="Submit" defaultValue="Add Notes" className="input" />
        <p className="error">
          {error}
        </p>
      </form>
    </div>
  )
};


function App() {
  const [notes, setNotes] = useState([])

  const fetchNotes = () => {
    getNotes().then(notes => { 
      console.log(notes)
      setNotes(notes)
    })
  }

  useEffect(() => {
    fetchNotes()
  },  [])

  return (
    <div className="App">
      <NotesForm handleNoteAdded={fetchNotes}/>
      <div className="">
        {
          notes.map(notesObj => <NotesCard
            key={notesObj.id}
            content={notesObj.content}
            title={notesObj.title}
            id={notesObj.id}
            // onDelete={getNotes}
          />)
        }
      </div>
    </div>
  );
}

export default App;
