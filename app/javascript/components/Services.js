const API_PEOPLE_URL = '/api/v1/people';

/**
 * Formats the json data into a readable row for the DataTable component
 */
const formatIntoRows = (data) => {
  return data.map((item)=> ({
    id: item.id,
    ...item.attributes,
    location: item.attributes.location?.name,
    affiliation: item.attributes.affiliation?.name,
  }))
}

/**
 * Calls db for the list of People
 */
export const getPeople = async () => {
  try {
    const response = await fetch(API_PEOPLE_URL);
    const { data } = await response.json();
    console.log('data', data);
    // console.log('data formatted', formatIntoRows(data));
    return formatIntoRows(data);
  } catch(err) {
    console.log(err);
  }
}

/**
 * Prepares payload to be in correct format for Rails Backend
 */
const formatIntoJson = (payload) => {
  const headers = payload[0];

  // Skip map on first row
  const body =  payload.slice(1).map((row, index)=>{
    
  })
}

/**
 * POST request to send CSV file to backend (not working)
 */
export const createPeople = async (payload) => {
  const postOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    // body: formatIntoJson(payload),
    body: JSON.stringify(payload),
  }

  try {
    const response = await fetch(API_PEOPLE_URL, postOptions);
    const { data } = await response.json();
    // console.log('data', data);
    // console.log('data formatted', formatIntoRows(data));
    return formatIntoRows(data);
  } catch(err) {
    console.log(err);
  }
}
