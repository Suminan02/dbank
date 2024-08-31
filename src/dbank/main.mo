import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  currentValue := 300;
  Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  let id = 123456;

  //Debug.print(debug_show (id));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large,currentValue less than zero.");
    };
  };
  public query func checkBalance() : async Float {
    return currentValue;

  };

  //topUp();

  public func compound() {
    let presentTime = Time.now();
    let timeElapsedMS = presentTime - startTime;
    let timeElapsedS = timeElapsedMS / 1000_000_000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := presentTime;
  };
};
