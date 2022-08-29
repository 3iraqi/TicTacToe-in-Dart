

import 'dart:io';

List board= [ [" "," "," "],
              [" "," "," "],
              [" "," "," "]];

String currantTurn="x";
int count=0;
bool change=true;
bool winner=false;
int scoreX=0;
int scoreO=0;
main(){
    print('[1,2,3]\n[4,5,6]\n[7,8,9]');
start :while(true){
  count=0;
  winner=false;
  print('Score\nx:$scoreX   O:$scoreO');
  printBoard(board);

game :while(true){
  change=true;

    stdout.write("Player $currantTurn Enter position");
    int position=int.parse(stdin.readLineSync()!);
    placeXorO(position);
    printBoard(board);
    winnerCheck(board);
    change==true?changePlayer():print("try again");
    if(count==9||winner){break game;}else{continue;}
  }//game loop
  if(winner&&currantTurn=="x"){
    print('X is a winner');
    scoreX++;
    }else if(winner&&currantTurn=="O"){
    print('player O is a winner');
    scoreO++;}//Score Counter
    print('1. Continue\n2. Exit');
    stdout.write("Insert Your Option::");
    int option=int.parse(stdin.readLineSync()!);
    switch(option){
      case 1: reset(board);count=0;break;
      case 2: scoreO=0;scoreX=0;break start;
      default:print('Error');continue start;
    }//option Switch
}//Start loop
}
void winnerCheck(List board){
  if(board[0][0]==currantTurn&&board[0][0]==board[0][1]&&board[0][0]==board[0][2]||board[0][0]==currantTurn&&board[0][0]==board[1][0]&&board[0][0]==board[2][0]||board[0][0]==currantTurn&&board[0][0]==board[1][1]&&board[0][0]==board[2][2]){
    print('The player $currantTurn is a Winner');
    winner =true;
  }else if(board[1][1]==currantTurn&&board[1][1]==board[0][1]&&board[1][1]==board[2][1]||board[1][1]==currantTurn&&board[1][1]==board[0][2]&&board[1][1]==board[2][0]||board[1][1]==currantTurn &&board[1][1]==board[1][0]&&board[1][1]==board[1][2]){
    print('The player $currantTurn is a Winner');winner =true;
  }else if(board[2][2]==currantTurn&&board[2][2]==board[1][2]&&board[2][2]==board[0][2]||board[2][2]==currantTurn&&board[2][2]==board[2][1]&&board[0][0]==board[2][0]){
    print('The player $currantTurn is a Winner');winner =true;
  }
}
void placeXorO(int position){
  switch(position){
  case 1:if(board[0][0]==" "){board[0][0]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 2:if(board[0][1]==" "){board[0][1]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 3:if(board[0][2]==" "){board[0][2]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 4:if(board[1][0]==" "){board[1][0]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 5:if(board[1][1]==" "){board[1][1]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 6:if(board[1][2]==" "){board[1][2]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 7:if(board[2][0]==" "){board[2][0]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 8:if(board[2][1]==" "){board[2][1]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
  case 9:if(board[2][2]==" "){board[2][2]=currantTurn;count++;}else{print("this position is already filled ");change=false;};break;
    default:
      print('This Is Invalid ');break;
  }//switch


}//placeXorO
void printBoard(List board){for(var i in board){print(i);}}
void changePlayer(){ currantTurn=="x"?currantTurn="o":currantTurn="x";}
void reset(List board){
  for(int x=0;x<3;x++) {
    for(int y=0;y<3;y++){
      board[x][y] = " "; }
  }}