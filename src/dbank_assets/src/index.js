import {dbank} from "../../declarations/dbank";

window.addEventListener("load", async function(){
  update();
});

document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault();  //prevents the form from refeshing

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);     //since input type is int we use parsefloat to connvert type
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);
  
  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length !=0){
    await dbank.topUp(inputAmount);
  }

  if (document.getElementById("withdrawal-amount").value.length !=0){
    await dbank.withdraw(outputAmount);
  }

  await dbank.compound();

 update();
   
  document.getElementById("input-amount").value = "";    //clears the entered value
  document.getElementById("withdrawal-amount").value = "";

  button.removeAttribute("disabled");
});

async function update(){
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) /100;
}