


let container=document.querySelector('.container')

const fetchUsers = async () => {
const data=  await  axios.get('https://jsonplaceholder.typicode.com/users')
     
        console.log(data)
const response=data.data
       

console.log(data)
let container=document.querySelector('.container')
let div =document.createElement('div')
div.classList.add('divcontainer')
// div.innerHTML=response.map((item,i)=>{
//         return `<div ${(key={i})}><p>${item.name}</p></div>`
// })
  


div.innerHTML= response.map((item,id)=>{
        return `<div class='mapcontainer' ${(key={id})}><p>Name:${item.name}</p>
        <p>Phone:${item.phone}</p>
        <p>Username:${item.username}</p>
        <p>Email:${item.email}</p>
        <p>Website:${item.website}</p>
        <p>City:${item.address.city}</p>
        <p>latitude:${item.address.geo.lat}</p>
        <p>longtitude:${item.address.geo.lng}</p>
        <p>Suite:${item.address.suite}</p>
        <p>Zipcode:${item.address.zipcode}</p>
        <p>Company Name:${item.company.name}</p>
        <p>catchphrase:${item.company.catchphrase}</p>
        <p>Bs:${item.company.bs}</p></div>`
}).join('')

container.appendChild(div)

};



fetchUsers();