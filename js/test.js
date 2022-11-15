var obj = {
    player1: {
        name: "thiru",
        age: "40",
        cars: [
            {name:"Ford", models:["Fiesta", "Focus", "Mustang"]},
            {name:"BMW", models:["320", "X3", "X5"]},
            {name:"Fiat", models:["500", "Panda"]}
          ]
    },
    player2:{
        name: "thirumili",
        age: "20",
        cars: [
            {name:"Ford", models:["Fiesta", "Focus", "Mustang"]},
            {name:"BMW", models:["320", "X3", "X5"]},
            {name:"Fiat", models:["500", "Panda"]}
          ]
    }
}

let x = "";
const myObj = {
  name: "John",
  age: 30,
  cars: [
    {name:"Ford", models:["Fiesta", "Focus", "Mustang"]},
    {name:"BMW", models:["320", "X3", "X5"]},
    {name:"Fiat", models:["500", "Panda"]}
  ]
}

for (let i in myObj.cars) {
  x += " " + myObj.cars[i].name + " ";
  for (let j in myObj.cars[i].models) {
    x += myObj.cars[i].models[j] + "\n";
  }
}
console.log(x)

// console.log(obj.player1)
// console.log(obj.player2.cars[0].models[0])