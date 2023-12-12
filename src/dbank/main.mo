import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"

actor Dbank{
  stable var currentValue: Float = 300;
  currentValue := 300;
  //Debug.print(debug_show(currentValue));

  let id = 12344455;
  //Debug.print("hello");
 //Debug.print(debug_show(id));
 
 stable var startTime = Time.now();
 startTime :=Time.now();
 Debug.print(debug_show(startTime));

public func topUp(amount: Float) : () {
  currentValue +=amount;
  Debug.print(debug_show(currentValue));
};

public func withdraw(amount : Float) : () {
  let tempValue: Float = currentValue - amount;
  if (tempValue >=0) {
  currentValue -=amount;
  Debug.print(debug_show(currentValue));
  } else{
    Debug.print(debug_show("the value is negative"));
  }
};

public func checkBalance() : async Float {
  return currentValue;
  
};

public func compound(){
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsed = timeElapsedNS/1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
  startTime := currentTime;
};

}

