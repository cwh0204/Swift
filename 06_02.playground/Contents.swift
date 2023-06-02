import UIKit

let frame = CGRect(x: 100, y: 100, width: 200, height: 100)
let view = UILabel(frame: frame)

view.backgroundColor = UIColor.red
view.textAlignment = .center
view.text = "Hello World!!"
for i in 1...5{
    i
    print("출력값은\(i)입니다")
}
var n = 1
while n < 10 {
    n = n + 1
    print("n의 값은 \(n) 입니다")
}
var a = 10
var b = 20
var c = 10
if b < a {
    print("b가 더큼")
}else if a == c {
    print("같음")
}


var value = 1
value += 1
value += 2
let onecos = 3
switch onecos {
case 1:
    print("1합격")
case 2:
    print("2합격")
case 3:
    print("3합격")
default :
    print("불합격")
}

func Hello(name : String) -> String{
    let Onecoss = "\(name)님 안녕하세요"
    return Onecoss
}
func printHello(){
    print("안녕하세요")
}
printHello()
func sayHello() -> String {
    let a1 = "안녕하세요"
    return a1
}
print("\(sayHello())입니다")
func printHellos (name: String){
    print("\(name)님 안녕하세요")
}
printHellos(name: "asssdd")
print(Hello(name: "onecos"))
