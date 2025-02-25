const express = require('express');
const bodyParser = require ('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

let items = [
    {name:'South Beach',image:'assets/images/travel_1.jpg',rate:'5.0',location:'Zhong li, Taiwan'},
    {name:'Mountain Village',image:'assets/images/travel_2.jpg',rate:'4.5',location:'Hu tao, Taiwan'},
    {name:'Sea Village',image:'assets/images/travel_3.jpg',rate:'4.0',location:'Genshin, Taiwan'},
    {name:'Mountain River',image:'assets/images/travel_4.jpg',rate:'3.5',location:'Tao dao, Taiwan'},
    {name:'River Village',image:'assets/images/travel_5.jpg',rate:'3',location:'Lumine, Taiwan'},
    {name:'Mountain Hill',image:'assets/images/travel_6.jpg',rate:'2.5',location:'Aether, Taiwan'},
    {name:'Capital Train',image:'assets/images/travel_7.jpg',rate:'2.0',location:'Doe tou, Taiwan'},
    {name:'Waterfall',image:'assets/images/travel_8.jpg',rate:'1.5',location:'Li pong, Taiwan'},
    {name:'River Village',image:'assets/images/travel_9.jpg',rate:'1.0',location:'Lumine, Taiwan'},
    {name:'Mountain Hill',image:'assets/images/travel_10.jpeg',rate:'1.0',location:'Aether, Taiwan'},
    {name:'Capital Train',image:'assets/images/travel_11.jpg',rate:'0.5',location:'Doe tou, Taiwan'},
    {name:'Waterfall',image:'assets/images/travel_12.jpg',rate:'0.0',location:'Li pong, Taiwan'},
];



  //routing
app.get('/items',(req,res)=>{
    res.json(items);
});

app.get('/items/:name',(req,res)=>{
    const item = items.find(i=>i.name==req.params.name);
    res.json(items);
});

app.listen(port,()=>{
    console.log(`Server is running at http://localhost:${port}`);
});