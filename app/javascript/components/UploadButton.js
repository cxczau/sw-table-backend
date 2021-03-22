import React, { useState } from 'react';
import { Button, Card, Typography } from '@material-ui/core';
import { CSVReader } from 'react-papaparse';
import { grey } from '@material-ui/core/colors';
import 'fontsource-roboto';

import { createPeople } from './Services';

const UploadButton = (props) => {
  const [data, setData] = useState(null);

  const handleOnFileLoad = (file) => {
    console.log('>>>>>>> UPLOADED FILE >>>>>>>')
    console.log(file)
    console.log('>>>>>>> UPLOADED FILE >>>>>>>')

    // const formData = new FormData();
    // formData.append('file', file);

    // setData(formData)
    setData(file)
  }

  return (
    <>
      <CSVReader
        onFileLoad={handleOnFileLoad}
      >
				{({ file }) => (
          <Card style={{
            width: 100,
            height: 100,
            color: grey
          }}>
            {file && (<Typography variant="body1">{file.name}</Typography>)}
          </Card>
				)}
			</CSVReader>

      <Button onClick={() => createPeople(data)} disabled={!data}>
        Click to upload
      </Button>
		</>
  )
}

export default UploadButton
