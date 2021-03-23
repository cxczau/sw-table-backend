import React, { useState, useEffect } from 'react';
import { DataGrid } from '@material-ui/data-grid';
import { TextField, Button, Typography, Box } from '@material-ui/core';
import 'fontsource-roboto';

import { getPeople } from './Services';
import UploadButton from './UploadButton';

const columns = [
  // { field: 'id', headerName: 'id', width: 65 },
  { field: 'name', headerName: 'Name', width: 150 },
  { field: 'location', headerName: 'Location', width: 200 },
  { field: 'species', headerName: 'Species', width: 200 },
  { field: 'gender', headerName: 'Gender', width: 80 },
  { field: 'affiliation', headerName: 'Affiliation', width: 200 },
  { field: 'weapon', headerName: 'Weapon', width: 200 },
  { field: 'vehicle', headerName: 'Vehicle', width: 200 }
]

const App = () => {
  const [table, setTable] = useState([]);
  const [filteredData, setFilteredData] = useState([]);
  const [filter, setFilter] = useState('');

  // On component render, call the API and retrieve the list of People
  useEffect(() => {
    getPeople().then((rows) => setTable(rows));
  }, [])

  const handleFilter = (filter) => {
    setFilter(filter);

    const result = table.map((row)=>{
      let searchTermFound = false;
      const keysArray = Object.keys(row);

      // Traverse over the row's key:value pairs
      for(let i=0; i<keysArray.length; i++){
        // See if any of the values contain the filtering value (case insensitive)
        if (
          typeof row[keysArray[i]] === 'string' &&
          row[keysArray[i]].toLowerCase().includes(filter.toLowerCase())
        ) {
          searchTermFound = true;
          break; 
        }
      }

      // If filtering value was found, return the row we are currently on
      if (searchTermFound) {
        return row
      }
    })

    // Commit the result to state (with all undefined values filtered out)
    setFilteredData(result.filter(function(e){return e}));
  }

  return (
    <Box style={{
      display: 'flex',
      flexDirection: 'column',
    }}>
      <TextField
        id="standard-basic"
        variant="outlined"
        label="Filtering on:"
        onChange={(event)=>handleFilter(event.target.value)}
        error={filter && !filteredData.length}
        style={{
          margin: '5px 0px'
        }}
      />

      {/* <UploadButton setTable={setTable} /> */}

      {/* <Button onClick={() => getPeople().then((rows) => setTable(rows))} >Refresh</Button> */}

      <Typography variant="body1">Please click the headings to sort by asc/desc order.</Typography>

			<div style={{ height: '90vh', width: 'min(100vw, 100%)' }}>
				<DataGrid rows={filter ? filteredData : table} columns={columns} pageSize={10} disableSelectionOnClick />
			</div>
		</Box>
  )
}

export default App
