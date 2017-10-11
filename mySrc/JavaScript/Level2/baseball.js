var computer = function() {
    var computer = [];
    while (computer.length < 3) {
        var newNum = parseInt((Math.random() * 9) + 1);
        if (!computer.includes(newNum)) {
            computer.push(newNum);
        }
    }
    return computer;
}();

var countResult = function(result, computer, guessNum) {
    for (var i = 0; i < guessNum.length; i++) {
        var num = parseInt(guessNum[i]);
        if (num == computer[i]) {
            result.set("strike", result.get("strike") + 1);
        } else if (computer.includes(num)) {
            result.set("ball", result.get("ball") + 1);
        }
    }
    return result;
}

var printResult = function(result) {
    var strResult = "";
    var strike = result.get("strike");
    var ball = result.get("ball");

    if (strike > 0) strResult += strike + " 스트라이크 ";
    if (ball > 0) strResult += ball + " 볼";

    if (strike == 0 && ball == 0) strResult += "낫싱";


    console.log(strResult);
    if (strike === 3) {
        console.log("성공! 축하드립니다!");
        var play = document.getElementById('play');
        play.innerHTML = '<h2>성공! 축하드립니다~!!</h2>';
    }
    return strResult;
}

var guess = document.getElementById("guess");
guess.addEventListener('click', function() {
    var player = document.getElementById("player");
    var inLen = player.value.length;
    if (inLen <= 0 || inLen != 3) {
        return;
    }

    console.log(player.value);

    var guessNum = player.value.split('');
    var result = new Map();
    result.set("strike", 0);
    result.set("ball", 0);
    result = countResult(result, computer, guessNum);

    var newDiv = document.createElement('div');
    newDiv.className = 'check';
    var resultText = player.value + " : " + printResult(result);
    var newDivText = document.createTextNode(resultText);
    newDiv.appendChild(newDivText);
    var result = document.getElementById("result");
    result.appendChild(newDiv);
    player.value = '';
});