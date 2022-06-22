import	axios from "axios";

const axiosClient = axios.create({
    baseURL: "http://localhost:4000"
})
export const geAllPartida = async()=>{
return axiosClient.get('/Juego',{
    headers:{authorization: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjoiY3VzdG9tIHBheWxvYWQiLCJ1c2VyRW1haWwiOiJBdHZabkNUOFpXQTZMTFlyU29AZXhhbXBsZS5jb20iLCJpYXQiOjE2NTU4OTgyMjUsImV4cCI6MTY1NTkzMjc4NSwiYXVkIjpbImh0dHA6Ly9sb2NhbGhvc3QvIl0sImlzcyI6Imh0dHA6Ly9wYXJ0aWRhLm9ydC8iLCJzdWIiOiJBdHZabkNUOFpXQTZMTFlyU28ifQ.QNVCojE2b0uyVZo4wQx7NjxlwFJGYzvnCvJ9jwMoSWE'}})
    .then(response=>{
    if(response.status<300){
        return response.data
    }else{
        console.log("La llamada salio bn, pero devolvio mal")
    }
}).catch(error=>{
    console.log(error); 
    return error;
});
}






